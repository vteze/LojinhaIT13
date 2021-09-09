using LojinhaIT13.Models;

namespace LojinhaIT13.Dtos
{
    public class ClienteDTO
    {
        public int ClienteId { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }

        public static ClienteDTO FromCliente(Cliente cliente)
        {
            return new ClienteDTO 
            { 
                ClienteId = cliente.ClienteId, 
                Nome = cliente.Nome, 
                Email = cliente.Email,
            };
        }
    }
}