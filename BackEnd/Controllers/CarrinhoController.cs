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

        /* REFATORAR MÉTODOS DO CARRINHO */

        // [HttpPost("{​​idCliente}​​")]
        // public ActionResult<CarrinhoDTO> AdicionaProduto(int idCliente, int idProduto, int quantidade)
        // {
        //     _logger.LogInformation($"Adiciona Produto: {idProduto}, Quantidade: {quantidade}, Cliente: {idCliente}");
        //     // se a quantidade for inválida retorna erro BadRequest.
        //     if (quantidade <= 0)
        //     {
        //         return BadRequest("Quantidade invalida");
        //     }
        //     // busca cliente do banco de dados
        //     var cliente = _basedados.Clientes
        //         .Include(c => c.Carrinho)
        //         .ThenInclude(carrinho => carrinho.CarrinhoProdutos)
        //         .Include(c => c.Carrinho)
        //         .ThenInclude(carrinho => carrinho.Produtos)
        //         .FirstOrDefault(c => c.ClienteId == idCliente);
        //     // se o cliente não for encontrado retorna erro NotFound.
        //     if (cliente == null)
        //     {
        //         return NotFound("Cliente nao encontrado");
        //     }
        //     // busca o produto no banco de dados
        //     var produto = _basedados.Produtos.Find(idProduto);
        //     // se o produto não for encontrado retorna erro NotFound.
        //     if (produto == null)
        //     {
        //         return NotFound("Produto nao encontrado");
        //     }
        //     // resgata Carrinho do objeto cliente
        //     var carrinho = cliente.Carrinho;
        //     // se o carrinho do cliente ainda não existir
        //     if (carrinho == null)
        //     {
        //         // cria um novo Carrinho e uma coleção de CarrinhoProduto
        //         carrinho = new Carrinho();
        //         carrinho.CarrinhoProdutos = new List<CarrinhoProduto>();
        //         // adicona o produto e a quantidade no carrinho
        //         carrinho.CarrinhoProdutos.Add(new CarrinhoProduto{ Quantidade = quantidade });
        //     }
        //     else
        //     {
        //         // verifica se já existe o produto no carrinho e, se existir, adiciona a quantidade
        //         if (carrinho.Produtos.Contains(produto))
        //         {
        //             carrinho.CarrinhoProdutos.Single(cp => cp.ProdutoId == produto.ProdutoId).Quantidade += quantidade;
        //         }
        //         else
        //         {
        //             // adicona o produto e a quantidade no carrinho
        //             carrinho.CarrinhoProdutos.Add(new CarrinhoProduto{ Quantidade = quantidade });
        //         }
        //     }
        //     var retorno = CarrinhoDTO.FromCarrinho(carrinho);
        //     _basedados.SaveChanges();
        //     return retorno;
        // }


        // // TODO: VERIFICAR A LÓGICA
        // [HttpPut("{​​idCliente}​​")]
        // public ActionResult<CarrinhoDTO> EditaQuantidadeProduto(int idCliente, int idProduto, int novaQuantidade)
        // {
        //     _logger.LogInformation($"Edita Quantidade de Produto: {idProduto}, Nova Quantidade: {novaQuantidade}, Cliente: {idCliente}");
        //     if (novaQuantidade <= 0)
        //     {
        //         return BadRequest("Quantidade invalida");
        //     }
        //     // busca cliente do banco de dados
        //     var cliente = _basedados.Clientes
        //         .Include(c => c.Carrinho)
        //         .ThenInclude(carrinho => carrinho.CarrinhoProdutos)
        //         .Include(c => c.Carrinho)
        //         .ThenInclude(carrinho => carrinho.Produtos)
        //         .FirstOrDefault(c => c.ClienteId == idCliente);
        //     // se o cliente não for encontrado retorna erro NotFound.
        //     if (cliente == null)
        //     {
        //         return NotFound("Cliente nao encontrado");
        //     }
        //     // busca o produto no banco de dados
        //     var produto = _basedados.Produtos.Find(idProduto);
        //     // se o produto não for encontrado retorna erro NotFound.
        //     if (produto == null)
        //     {
        //         return NotFound("Produto nao encontrado");
        //     }
        //     // resgata Carrinho do objeto cliente
        //     var carrinho = cliente.Carrinho;
        //     // se o carrinho do cliente ainda não existir
        //     if (carrinho == null)
        //     {
        //         // cria um novo Carrinho e uma coleção de CarrinhoProduto
        //         carrinho = new Carrinho();
        //         carrinho.CarrinhoProdutos = new List<CarrinhoProduto>();
        //         // adicona o produto e a quantidade no carrinho
        //         carrinho.CarrinhoProdutos.Add(new CarrinhoProduto{ Quantidade = novaQuantidade });
        //     }
        //     else
        //     {
        //         // verifica se já existe o produto no carrinho e, se existir, adiciona a quantidade
        //         if (carrinho.Produtos.Contains(produto))
        //         {
        //             carrinho.CarrinhoProdutos.Single(cp => cp.ProdutoId == produto.ProdutoId).Quantidade = novaQuantidade;
        //         }
        //     }
        //     var retorno = CarrinhoDTO.FromCarrinho(carrinho);
        //     _basedados.SaveChanges();
        //     return retorno;
        // }

        // //remover produto



        // [HttpGet("{idCliente}")]
        // public ActionResult<CarrinhoDTO> ConsultaCarrinho(int idCliente)
        // {
        //     var cliente = _basedados.Clientes
        //         .Include(c => c.Carrinho)
        //         .ThenInclude(carrinho => carrinho.CarrinhoProdutos)
        //         .FirstOrDefault(c => c.ClienteId == idCliente);
        //     if (cliente == null)
        //     {
        //         return NotFound();
        //     }
        //     var carrinho = cliente.Carrinho;
        //     return CarrinhoDTO.FromCarrinho(carrinho);
        // }
    }
}