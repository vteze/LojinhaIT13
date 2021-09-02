using System;
using System.Collections.Generic;

namespace LojinhaIT13.Models
{
    public class Pedido
    {
        public int PedidoId { get; set; }
        public DateTime DataEmissao { get; set; }
        public int ClienteId { get; set; }
        public Cliente Cliente { get; set; }
        public ICollection<Produto> Produtos { get; set; }
        public List<PedidoProduto> PedidoProdutos { get; set; }

        public bool Fechado() => DataEmissao == null ? false : true
    }
}