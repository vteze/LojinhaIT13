namespace LojinhaIT13.Models
{
    public class PedidoProduto
    {
        public int Quantidade { get; set; }
        public decimal ValorUnitario { get; set;}
        public int PedidoId { get; set ;}
        public Pedido Pedido { get; set; }
        public int ProdutoId { get; set; }
        public Produto Produto { get ; set; }
    }
}