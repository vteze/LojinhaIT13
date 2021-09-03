using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using LojinhaIT13.Models;
using LojinhaIT13.Dtos;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Cors;


namespace LojinhaIT13.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [EnableCors("AllowAll")]
    public class ClientesController : ControllerBase
    {
        private readonly ILogger<ProdutosController> _logger;
        private readonly BdContext _basedados;

        public ClientesController(ILogger<ProdutosController> logger, BdContext basedados)
        {
            _logger = logger;
            _basedados = basedados;
        }

        //GET /clientes
        [HttpGet]
        public ActionResult<IEnumerable<ClienteDTO>> BuscarTodosClientes([FromQuery] string pesquisa)
        {
            if (pesquisa != null)
            {
                var resultado = _basedados.Clientes
                    .Select(ClienteDTO.FromCliente)
                    .Where(cliente => cliente.Nome.Contains(pesquisa.ToLower()));
                if (resultado.Count() == 0)
                {
                    return BadRequest("Nenhum cliente encontrado.");
                }
                else
                {
                    return resultado.ToList();
                }
            }
            return _basedados.Clientes.Select(ClienteDTO.FromCliente).ToList();
        }

        [HttpGet("{idCliente}")]
        public ActionResult<PedidoDTO> BuscarCarrinhoCliente(int idCliente)
        {
            //busca cliente
            var cliente = _basedados.Clientes.Find(idCliente);
            if (cliente == null)
            {
                return NotFound("Cliente nao encontrado");
            }

            //busca pedido que não esta fechado
            var pedido = _basedados.Pedidos
                .Include(p => p.Cliente)
                .Include(p => p.PedidoProdutos)
                .ThenInclude(pp => pp.Produto)
                .FirstOrDefault(p => p.ClienteId == idCliente && p.DataEmissao == null);
            
            if (pedido == null)
            {
                pedido = new Pedido();
                pedido.Cliente = cliente;
                pedido.PedidoProdutos = new List<PedidoProduto>();
                _basedados.Pedidos.Add(pedido);
                _basedados.SaveChanges();
                pedido = _basedados.Pedidos
                    .Include(p => p.Cliente)
                    .Include(p => p.PedidoProdutos)
                    .ThenInclude(pp => pp.Produto)
                    .FirstOrDefault(p => p.ClienteId == idCliente && p.DataEmissao == null);
            }

            return PedidoDTO.FromPedido(pedido);          
        }
    }
}
