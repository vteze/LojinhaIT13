using System.Collections.Generic;

namespace LojinhaIT13.Models
{
    public class Produto
    {
        public int      ProdutoId { get; set; }
        public string Nome { get; set; }
        public decimal Preco { get; set; }
        public string UrlImagem { get; set; }
        public ICollection<Pedido> Pedidos { get; set; }
        public List<PedidoProduto> PedidoProdutos { get; set; }
    }
}