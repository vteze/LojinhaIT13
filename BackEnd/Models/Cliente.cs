using System.Collections.Generic;

namespace LojinhaIT13.Models
{
    public class Cliente
    {
        public int ClienteId { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public List<Pedido> Pedidos { get; set; }
        public Carrinho Carrinho { get; set; }
        public int CarrinhoId { get; set; }
    }
}