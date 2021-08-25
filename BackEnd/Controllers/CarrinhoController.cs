using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using LojinhaIT13.Models;
using LojinhaIT13.Dtos;
using System.Collections.Concurrent;
using LojinhaIT13.Service;

namespace LojinhaIT13.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CarrinhoController : ControllerBase
    {
        private readonly ILogger<CarrinhoController> _logger;
        private readonly BdContext _basedados;
        private readonly CarrinhoService _carrinho;

        public CarrinhoController(ILogger<CarrinhoController> logger, BdContext basedados, CarrinhoService carrinho)
        {
            _logger = logger;
            _basedados = basedados;
            _carrinho = carrinho;
        }

        [HttpPost("{idCliente}/{idProduto}")]
        public ActionResult<ProdutoDTO> adicionaProduto(int idCliente, int idProduto)
        {   
            _logger.LogInformation($"Consulta Produto: {idProduto}");
            var produto = _basedados.Produtos.Where(p => p.ProdutoId == idProduto ).Select(ProdutoDTO.FromProduto).FirstOrDefault();
            var cliente = _basedados.Clientes.Find(idCliente);
            if (cliente == null || produto == null)
            {
                return NotFound();
            }
            return null; // SÓ PARA NAO DAR ERRO
            // if (_carrinho.TryAdd(cliente, new List<ProdutoDTO>{produto}))
            // {
            //     return Ok("tudo certo");
            // }
            // else
            // {
            //     _carrinho[cliente] = _carrinho[cliente].Append(produto);
            //     return Ok();
            // }
            
        }

        [HttpGet("{idCliente}")]
        public ActionResult<IEnumerable<ProdutoDTO>> ConsultaCarrinho(int idCliente) 
        {
            var cliente = _basedados.Clientes.Find(idCliente);
            if (cliente == null)
            {
                return NotFound();
            }
            return null; // SÓ PARA NAO DAR ERRO
            // if (!_carrinho.ContainsKey(cliente))
            // {
            //     return BadRequest();
            // }
            // return _carrinho[cliente].ToList();
        }
    }
}