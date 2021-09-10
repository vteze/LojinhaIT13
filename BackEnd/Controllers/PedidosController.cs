using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using LojinhaIT13.Models;
using LojinhaIT13.Dtos;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Cors;

//=========================================================================
//CODE REVIEW: Implementar atualização do valor do produto quando entrar na tela carrinho 
//pode ser realizado na feat 6
//=========================================================================

namespace LojinhaIT13.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [EnableCors("AllowAll")]
    public class PedidosController : ControllerBase
    {
        private readonly ILogger<ProdutosController> _logger;
        private readonly BdContext _basedados;

        public PedidosController(ILogger<ProdutosController> logger, BdContext basedados) {
            _logger = logger;
            _basedados = basedados;
        }

        //POST /pedidos/fecha/{:pedidoId}
        [HttpPost]
        [Route("fecha/{pedidoId}")]
        public ActionResult<PedidoDTO> FechaPedido(int pedidoId)
        {    
            /*  VERIFICAR SE O FechaPedido RETORNA UM PEDIDO NOVO OU NÃO RETORNA NADA */
            
            // Buscar pedido retornando os produtos associados (eager loading)
            var pedido = _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.Cliente)
                .FirstOrDefault(p => p.PedidoId == pedidoId);

            if(pedido == null)
            {
                return BadRequest("Pedido inexistente");
            }

            if(pedido.DataEmissao != null)
            {
                return BadRequest("Pedido já finalizado");
            }

            if(pedido.PedidoProdutos.Count == 0)
            {
                return BadRequest("Pedido não formulado");
            }

            pedido.DataEmissao = DateTime.Now;

            pedido.PedidoProdutos.ForEach(pp => 
                pp.ValorUnitario = pp.Produto.Preco
            );

            var retorno = PedidoDTO.FromPedido(pedido);
            
            _basedados.SaveChanges();
            
            return retorno;
        }

        // TOOD: se não existir um pedido, criar um ao adicionar um produto
        //POST /pedidos/adiciona/{:pedidoId}?produtoId={produtoId}
        [HttpPost]
        [Route("adiciona/{pedidoId}")]
        public async Task<ActionResult<PedidoDTO>> AdicionaProduto(
            int pedidoId, 
            [FromQuery] int produtoId
        ) {    
            // Buscar pedido retornando os produtos associados (eager loading)
            var pedido = _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.Cliente)
                .FirstOrDefault(p => p.PedidoId == pedidoId);

            if(pedido == null)
            {
                return BadRequest("Pedido inexistente");
            }

            if(pedido.DataEmissao != null)
            {
                return BadRequest("Pedido já finalizado");
            }

            if (pedido.PedidoProdutos.Find(pp => pp.ProdutoId == produtoId) != null)
            {
                return BadRequest("Produto já inserido");
            }

            var produto = await _basedados.Produtos.FindAsync(produtoId);

            if(produto == null)
            {
                return BadRequest("Produto inexistente");
            }

            // Adicionar produto no pedido
            pedido.PedidoProdutos.Add(new PedidoProduto{
                Produto = produto,
                Pedido = pedido,
                Quantidade = 1,
                ValorUnitario = produto.Preco,
            });

            await _basedados.SaveChangesAsync();
            
            return PedidoDTO.FromPedido(pedido);
        }
    }
}