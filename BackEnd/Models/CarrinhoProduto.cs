namespace LojinhaIT13.Models 
{
    public class CarrinhoProduto
    {
        public Carrinho Carrinho { get; set; }
        public int CarrinhoId { get; set; }
        public Produto Produto { get; set; }
        public int ProdutoId { get; set; }
        public int Quantidade { get; set; }
        // public decimal ValorUnitario { get; set; } // Enquanto não fechar a compra, não podemos manter o valor salvo no carrinho
    }
}