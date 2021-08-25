using System.Collections.Generic;

namespace LojinhaIT13.Models
{
    public class Carrinho
    {
        public int CarrinhoId { get; set; }
        public Cliente Cliente { get; set; }
        public int ClienteId { get; set; }
        public ICollection<CarrinhoProduto> CarrinhoProdutos { get; set; }
        public List<Produto> Produtos { get; set; }
    }
}