using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using LojinhaIT13.Models;
using LojinhaIT13.Dtos;
using Microsoft.EntityFrameworkCore;

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
        public async Task<ActionResult<PedidoDTO>> FecharPedido(int pedidoID)
        {         
            var pedido = await _basedados.Pedidos
                .Include(p => p.DataEmissao)
                .Include ()
            if(pedido == null)
            {
                return BadRequest("Pedido inexistente");
            }
            if(pedido.DataEmissao != null)
            {
                return BadRequest("Pedido já finalizado");
            }
            pedido.DataEmissao = DateTime.Now;


            /*
            var cliente = await _basedados.Clientes.FindAsync(carrinho.IdCliente);
            if (cliente == null)
            {
                return BadRequest("Cliente não encontrado");
            }
            pedido.Cliente = cliente;
            if (carrinho.Itens.Count() == 0)
            {
                return BadRequest("Carrinho vazio");
            }
            pedido.PedidoProdutos = new List<PedidoProduto>();
            foreach (var item in carrinho.Itens)
            {
                var produto = await _basedados.Produtos.FindAsync(item.CodigoProduto);
                if (produto == null)
                {
                    return BadRequest($"Produto não encontrado {item.CodigoProduto}");
                }
                pedido.PedidoProdutos.Add(new PedidoProduto 
                    {
                        // Pedido = pedido,
                        // PedidoId = pedido.PedidoId,
                        Produto = produto,
                        // ProdutoId = produto.ProdutoId,
                        Quantidade = item.Quantidade,
                        ValorUnitario = produto.Preco
                    });
                // pedido.Produtos.Add(produto);
            }
            await _basedados.Pedidos.AddAsync(pedido);
            await _basedados.SaveChangesAsync();
            return PedidoDTO.FromPedido(pedido);*/
        }
    }
}