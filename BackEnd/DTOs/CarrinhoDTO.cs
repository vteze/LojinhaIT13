using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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
    }

    public class CarrinhoItemDTO
    {
        [Required]
        public int CodigoProduto { get; set; }
        [Required]
        [Range(1, 10)]
        public int Quantidade { get; set; }
    }
}