using System;
using System.Collections.Generic;
using LojinhaIT13.Models;
using System.Linq;

namespace LojinhaIT13.Dtos
{
    public class PedidoDTO
    {
        public int Codigo { get; set; }
        public DateTime DataEmissao { get; set; }
        public string NomeCliente { get; set; }
        public string EmailCliente { get; set; }
        public IEnumerable<PedidoItemDTO> Itens { get; set; }
        public decimal ValorTotal { get; set; }

        public static PedidoDTO FromPedido(Pedido pedido)
        {
            // var itens = pedido.PedidoProdutos.Select(pp => new PedidoItemDTO { CodigoProduto = pp.ProdutoId, NomeProduto = pp.Produto.Nome, Quantidade = pp.Quantidade } );
            return new PedidoDTO
            {
                Codigo = pedido.PedidoId,
                DataEmissao = pedido.DataEmissao,
                NomeCliente = pedido.Cliente.Nome,
                EmailCliente = pedido.Cliente.Email,
                Itens = pedido.PedidoProdutos.Select(pp => PedidoItemDTO.FromPedido(pp)),
                ValorTotal = pedido.PedidoProdutos.Sum(pp => pp.Quantidade * pp.ValorUnitario),
            };
        }
    }

    public class PedidoItemDTO
    {
        public int CodigoProduto { get; set; }
        public string NomeProduto {get; set;}
        public int Quantidade { get; set; }

        public static PedidoItemDTO FromPedido(PedidoProduto pedidoProduto)
        {
            return new PedidoItemDTO
            { 
                CodigoProduto = pedidoProduto.ProdutoId, 
                NomeProduto = pedidoProduto.Produto.Nome, 
                Quantidade = pedidoProduto.Quantidade 
            };
        }

    }
}