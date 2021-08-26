using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using LojinhaIT13.Models;
using Microsoft.EntityFrameworkCore;
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

        public CarrinhoController(ILogger<CarrinhoController> logger, BdContext basedados)
        {
            _logger = logger;
            _basedados = basedados;
        }


        [HttpPost("{​​idCliente}​​")]
        public ActionResult<CarrinhoDTO> adicionaProduto(int idCliente, int idProduto, int quantidade)
        {
            _logger.LogInformation($"Adiciona Produto: {idProduto}");

            if (quantidade <= 0)
            {
                return BadRequest("Quantidade inválida");
            }
            else
            {
                var cliente = _basedados.Clientes.Find(idCliente);            //Include(c => c.Carrinho).FirstOrDefaultAsync();
                if (cliente == null)
                {
                    return NotFound();
                }
                else
                {
                    var produto = _basedados.Produtos.Find(idProduto);
                    if (produto == null)
                    {
                        return NotFound();
                    }
                    else
                    {
                        var carrinho = cliente.Carrinho;             //_basedados.Carrinhos.SingleOrDefault(c => c.ClienteId == cliente.ClienteId);
                        if (carrinho == null)
                        {
                            carrinho = new Carrinho();
                        }
                        else
                        {
                            if (carrinho.Produtos.Contains(produto))
                            {
                                carrinho.CarrinhoProdutos.Single(cp => cp.ProdutoId == produto.ProdutoId).Quantidade += quantidade;
                            }
                        }
                    }
                }
            }

            return null;
        }




        //[]

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