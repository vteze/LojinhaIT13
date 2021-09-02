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
    }
}
