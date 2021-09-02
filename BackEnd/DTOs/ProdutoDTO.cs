using LojinhaIT13.Models;

namespace LojinhaIT13.Dtos
{
    public class ProdutoDTO
    {
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public string UrlImagem { get; set; }
        public decimal PrecoUnitario { get; set; }
        public static ProdutoDTO FromProduto (Produto produto)
        {
            return new ProdutoDTO 
            { 
                Codigo = produto.ProdutoId, 
                Nome = produto.Nome, 
                PrecoUnitario = produto.Preco,
                Descricao = produto.Descricao,
                UrlImagem = produto.UrlImagem,
            };
        }
    }
}