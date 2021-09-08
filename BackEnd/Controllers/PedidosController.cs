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

namespace LojinhaIT13.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PedidosController : ControllerBase
    {
        private readonly ILogger<ProdutosController> _logger;
        private readonly BdContext _basedados;

        public PedidosController(ILogger<ProdutosController> logger, BdContext basedados)
        {
            _logger = logger;
            _basedados = basedados;
        }

        //POST /pedidos
        [HttpPost]
        public ActionResult<PedidoDTO> FecharPedido(int pedidoID)
        {         
            var pedido = _basedados.Pedidos
                .Include(p => p.DataEmissao)
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .FirstOrDefault(p => p.PedidoId == pedidoID);

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
            
            /* REUTILIZAR FLUXO DE INSERIR PedidoProduto */

            // pedido.PedidoProdutos = new List<PedidoProduto>();
            // foreach (var item in carrinho.Itens)
            // {
            //     var produto = await _basedados.Produtos.FindAsync(item.CodigoProduto);
            //     if (produto == null)
            //     {
            //         return BadRequest($"Produto não encontrado {item.CodigoProduto}");
            //     }
            //     pedido.PedidoProdutos.Add(new PedidoProduto 
            //         {
            //             // Pedido = pedido,
            //             // PedidoId = pedido.PedidoId,
            //             Produto = produto,
            //             // ProdutoId = produto.ProdutoId,
            //             Quantidade = item.Quantidade,
            //             ValorUnitario = produto.Preco
            //         });
            //     // pedido.Produtos.Add(produto);
            // }
            // await _basedados.Pedidos.AddAsync(pedido);
            // await _basedados.SaveChangesAsync();
            // return PedidoDTO.FromPedido(pedido);

            
        }

 //POST /pedidos/adiciona/{:pedidoId}?produtoId={produtoId}
        [HttpPut]
        [Route("carrinho/adiciona/{pedidoId}")]
        public async Task<ActionResult<PedidoDTO>> AumentaQuantidade(
            int pedidoId, 
            [FromQuery] int produtoId) 
        {    
            // Buscar pedido retornando os produtos associados (eager loading)
            var pedido = _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pro => pro.Quantidade)
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

            pedido.PedidoProdutos.Find(p => p.ProdutoId == produtoId).Quantidade++;
        

            await _basedados.SaveChangesAsync();
            
            return PedidoDTO.FromPedido(pedido);
        }


        [HttpPut]
        [Route("carrinho/{pedidoId}")]
        public async Task<ActionResult<PedidoDTO>> DiminuiQuantidade(
            int pedidoId, 
            [FromQuery] int produtoId) 
        {    
            // Buscar pedido retornando os produtos associados (eager loading)
            var pedido = _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pro => pro.Quantidade)
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

            pedido.PedidoProdutos.Find(p => p.ProdutoId == produtoId).Quantidade--;
        

            await _basedados.SaveChangesAsync();
            
            return PedidoDTO.FromPedido(pedido);
        }
    }
}

    
