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
    public class ProdutosController : ControllerBase
    {
        private readonly ILogger<ProdutosController> _logger;
        private readonly BdContext _basedados;

        public ProdutosController(ILogger<ProdutosController> logger, BdContext basedados)
        {
            _logger = logger;
            _basedados = basedados;
        }

        //GET /produtos?pesquisa=[pesquisa]
        [HttpGet]
        public IEnumerable<ProdutoDTO> BuscarTodosProdutos([FromQuery] string pesquisa)
        {
            if (pesquisa != null)
            {
                return _basedados.Produtos
                    .Select(ProdutoDTO.FromProduto)
                    .Where(produto => produto.Nome.Contains(pesquisa.ToLower()));    
            }

            return _basedados.Produtos.Select(ProdutoDTO.FromProduto);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(400)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<ActionResult<ProdutoDTO>> BuscarProdutoPorId(int id)
        {
            try 
            {
                var produto = await _basedados.Produtos
                    .AsNoTracking()
                    .SingleOrDefaultAsync<Produto>(p => p.ProdutoId == id);
                if (produto == null)
                {
                    return NotFound();
                }
                return ProdutoDTO.FromProduto(produto);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Falha na consulta do produto com id {id}");
                throw;
            }
        }
    }
}
