using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using LojinhaIT13.Models;

namespace LojinhaIT13.Dtos
{
    public class CarrinhoDTO
    {
        [Required]
        public int IdCliente { get; set; }
        [Required]
        [MaxLength(45)]
        public string NomeCliente { get; set; }
        [EmailAddress]
        public string EmailCliente { get; set; }
        public IEnumerable<CarrinhoItemDTO> Itens { get; set; }

        public static CarrinhoDTO FromCarrinho(Carrinho carrinho)
        {
            return new CarrinhoDTO
            {
                IdCliente = carrinho.CarrinhoId,
                NomeCliente = carrinho.Cliente.Nome,
                EmailCliente = carrinho.Cliente.Email,
                Itens = carrinho.CarrinhoProdutos.Select(pp => new CarrinhoItemDTO
                {
                    CodigoProduto = pp.ProdutoId,
                    Quantidade = pp.Quantidade
                })
            };
        }
    }

    public class CarrinhoItemDTO
    {
        [Required]
        public int CodigoProduto { get; set; }
        [Required]
        public int Quantidade { get; set; }
    }
}