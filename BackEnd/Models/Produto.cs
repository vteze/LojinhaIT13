using System.Collections.Generic;

namespace LojinhaIT13.Models
{
    public class Produto
    {
        public ICollection<Pedido> Pedidos { get; set; }
        public int ProdutoId { get; set; }
        public string Nome { get; set; }
        public decimal Preco { get; set; }
        public List<PedidoProduto> PedidoProdutos { get; set; }
        public ICollection<Carrinho> Carrinhos { get; set; }
        public List<CarrinhoProduto> CarrinhoProdutos { get; set; }
    }
}