using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using LojinhaIT13.Models;
using LojinhaIT13.Dtos;

namespace LojinhaIT13.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProdutosController : ControllerBase
    {
        private readonly ILogger<ProdutosController> _logger;
        private readonly BdContext _basedados;

        public ProdutosController(ILogger<ProdutosController> logger, BdContext basedados)
        {
            _logger = logger;
            _basedados = basedados;
        }

        //GET /produtos
        [HttpGet]
        public IEnumerable<ProdutoDTO> BuscarTodosProdutos()
        {
            return _basedados.Produtos.Select(ProdutoDTO.FromProduto);
        }

        [HttpGet("{id}")]
        public ActionResult<ProdutoDTO> BuscarProdutoId(int id)
        {
            _logger.LogInformation($"Consulta Produto: {id}");
            var dados = _basedados.Produtos.Where(p => p.ProdutoId == id).Select(ProdutoDTO.FromProduto).FirstOrDefault();
            if(dados != null)
            {
                return dados;
            }
            return NotFound();
        }
    }
}
