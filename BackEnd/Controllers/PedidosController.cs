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
<<<<<<< HEAD
        public ActionResult<PedidoDTO> FecharPedido(int pedidoID)
        {
=======
        [Route("fecha/{pedidoId}")]
        public ActionResult<PedidoDTO> FechaPedido(int pedidoId)
        {    
            /*  VERIFICAR SE O FechaPedido RETORNA UM PEDIDO NOVO OU NÃO RETORNA NADA */
            
            // Buscar pedido retornando os produtos associados (eager loading)
>>>>>>> 73f56568b8bc9c0606235af6cf6c43294e076e33
            var pedido = _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.Cliente)
                .FirstOrDefault(p => p.PedidoId == pedidoId);

            if (pedido == null)
            {
                return BadRequest("Pedido inexistente");
            }

            if (pedido.DataEmissao != null)
            {
                return BadRequest("Pedido já finalizado");
            }

            if (pedido.PedidoProdutos.Count == 0)
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
<<<<<<< HEAD

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

        //PUT /pedidos/carrinho/adiciona/{:pedidoId}?produtoId={produtoId}
        [HttpPut]
        [Route("carrinho/adiciona/{pedidoId}")]
        public async Task<ActionResult<PedidoDTO>> AumentaQuantidade(
            int pedidoId,
            [FromQuery] int produtoId)
        {
=======
        }

        // TOOD: se não existir um pedido, criar um ao adicionar um produto
        //POST /pedidos/adiciona/{:pedidoId}?produtoId={produtoId}
        [HttpPost]
        [Route("adiciona/{pedidoId}")]
        public async Task<ActionResult<PedidoDTO>> AdicionaProduto(
            int pedidoId, 
            [FromQuery] int produtoId
        ) {    
>>>>>>> 73f56568b8bc9c0606235af6cf6c43294e076e33
            // Buscar pedido retornando os produtos associados (eager loading)
            var pedido = _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.Cliente)
                .FirstOrDefault(p => p.PedidoId == pedidoId);

<<<<<<< HEAD

            if (pedido == null)
=======
            if(pedido == null)
>>>>>>> 73f56568b8bc9c0606235af6cf6c43294e076e33
            {
                return BadRequest("Pedido inexistente");
            }

<<<<<<< HEAD
            if (pedido.DataEmissao != null)
=======
            if(pedido.DataEmissao != null)
>>>>>>> 73f56568b8bc9c0606235af6cf6c43294e076e33
            {
                return BadRequest("Pedido já finalizado");
            }

<<<<<<< HEAD
            var produto = await _basedados.Produtos.FindAsync(produtoId);

            if (produto == null)
            {
                return BadRequest("Produto inexistente");
            }

            var pedprod = pedido.PedidoProdutos.Find(p => p.ProdutoId == produtoId);

            if (pedprod == null)
            {
                return BadRequest("Produto não inserido no carrinho");
            }

            pedprod.Quantidade++;

            await _basedados.SaveChangesAsync();

            return PedidoDTO.FromPedido(pedido);
        }

        //PUT /pedidos/carrinho/diminui/{:pedidoId}?produtoId={produtoId}
        [HttpPut]
        [Route("carrinho/diminui/{pedidoId}")]
        public async Task<ActionResult<PedidoDTO>> DiminuiQuantidade(
            int pedidoId,
            [FromQuery] int produtoId)
        {
            // Buscar pedido retornando os produtos associados (eager loading)
            var pedido = _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.Cliente)
                .FirstOrDefault(p => p.PedidoId == pedidoId);


            if (pedido == null)
            {
                return BadRequest("Pedido inexistente");
            }

            if (pedido.DataEmissao != null)
            {
                return BadRequest("Pedido já finalizado");
=======
            if (pedido.PedidoProdutos.Find(pp => pp.ProdutoId == produtoId) != null)
            {
                return BadRequest("Produto já inserido");
>>>>>>> 73f56568b8bc9c0606235af6cf6c43294e076e33
            }

            var produto = await _basedados.Produtos.FindAsync(produtoId);

<<<<<<< HEAD

            if (produto == null)
=======
            if(produto == null)
>>>>>>> 73f56568b8bc9c0606235af6cf6c43294e076e33
            {
                return BadRequest("Produto inexistente");
            }

<<<<<<< HEAD

            var pedprod = pedido.PedidoProdutos.Find(p => p.ProdutoId == produtoId);

            if (pedprod == null)
            {
                return BadRequest("Produto não inserido no carrinho");
            }

            if (pedprod.Quantidade <= 1)
            {
                return BadRequest("Quantidade menor que 1");
            }
            pedprod.Quantidade--;


            await _basedados.SaveChangesAsync();

            return PedidoDTO.FromPedido(pedido);
        }

        [HttpGet]
        [Route("carrinho/{pedidoId}")]
        public async Task<ActionResult<PedidoDTO>> BuscarCarrinho(int pedidoId)
        {
            //busca cliente
            var pedido = await _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.Cliente)
                .FirstOrDefaultAsync(p => p.PedidoId == pedidoId);

            if (pedido == null)
            {
                return BadRequest("Pedido inexistente");
            }

            if (pedido.DataEmissao != null)
            {
                return BadRequest("Pedido já finalizado");
            }

            // Atualiza o valor unitário de cada um dos produtos do pedido
            pedido.PedidoProdutos.ForEach(pp => pp.ValorUnitario = pp.Produto.Preco);

            await _basedados.SaveChangesAsync();

=======
            // Adicionar produto no pedido
            pedido.PedidoProdutos.Add(new PedidoProduto{
                Produto = produto,
                Pedido = pedido,
                Quantidade = 1,
                ValorUnitario = produto.Preco,
            });

            await _basedados.SaveChangesAsync();
            
>>>>>>> 73f56568b8bc9c0606235af6cf6c43294e076e33
            return PedidoDTO.FromPedido(pedido);
        }

        [HttpDelete]
        [Route("carrinho/remove/{pedidoId}")]

        public async Task<ActionResult<PedidoDTO>> RemoveProduto(int pedidoId, [FromQuery] int produtoId)
        {
            
            var pedido = await _basedados.Pedidos
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .Include(p => p.Cliente)
                .FirstOrDefaultAsync(p => p.PedidoId == pedidoId);

            if (pedido == null)
            {
                return BadRequest("Pedido inexistente");
            }

            if(pedido.DataEmissao != null)
            {
                return BadRequest("Pedido já finalizado");
            }

            var index = pedido.PedidoProdutos.FindIndex(p => p.ProdutoId == produtoId);
            
            if(index == -1)
            {
                return BadRequest("Produto não está no pedido.");
            }
            pedido.PedidoProdutos.RemoveAt(index);

            await _basedados.SaveChangesAsync();

            return PedidoDTO.FromPedido(pedido);
        }

    }
}


