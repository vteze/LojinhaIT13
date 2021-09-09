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

//=========================================================================
//CODE REVIEW: Implementar atualização do valor do produto quando entrar na tela carrinho 
//pode ser realizado na feat 6
//=========================================================================

namespace LojinhaIT13.Controllers
{
  [ApiController]
  [Route("[controller]")]
  [EnableCors("AllowAll")]
  public class PedidosController : ControllerBase
  {
    private readonly ILogger<ProdutosController> _logger;
    private readonly BdContext _basedados;

    public PedidosController(ILogger<ProdutosController> logger, BdContext basedados)
    {
      _logger = logger;
      _basedados = basedados;
    }

    // TOOD: se não existir um pedido, criar um ao adicionar um produto
    //POST /pedidos/adiciona/{:pedidoId}?produtoId={produtoId}
    [HttpPost]
    [Route("adiciona/{pedidoId}")]
    public async Task<ActionResult<PedidoDTO>> AdicionaProduto(
        int pedidoId,
        [FromQuery] int produtoId
    )
    {
      // Buscar pedido retornando os produtos associados (eager loading)
      var pedido = _basedados.Pedidos
          .Include(p => p.PedidoProdutos)
          .ThenInclude(pp => pp.Produto)
          .Include(p => p.Cliente)
          .FirstOrDefault(p => p.PedidoId == pedidoId);

      if (pedido == null)
      {
        return BadRequest("Pedido inexistente");
      }

      if (pedido.DataEmissao != null)
      {
        return BadRequest("Pedido já finalizado");
      }

      if (pedido.PedidoProdutos.Find(pp => pp.ProdutoId == produtoId) != null)
      {
        return BadRequest("Produto já inserido");
      }

      var produto = await _basedados.Produtos.FindAsync(produtoId);

      if (produto == null)
      {
        return BadRequest("Produto inexistente");
      }

      // Adicionar produto no pedido
      pedido.PedidoProdutos.Add(new PedidoProduto
      {
        Produto = produto,
        Pedido = pedido,
        Quantidade = 1,
        ValorUnitario = produto.Preco,
      });

      await _basedados.SaveChangesAsync();

      return PedidoDTO.FromPedido(pedido);
    }

    //POST /pedidos/carrinho/fecha/{:pedidoId}

    [HttpPost]

    [Route("carrinho/fecha/{pedidoId}")]

    public ActionResult<PedidoDTO> FecharPedido(int pedidoId)
    {
      var pedido = _basedados.Pedidos
          .Include(p => p.PedidoProdutos)
          .ThenInclude(pp => pp.Produto)
          .Include(p => p.Cliente)
          .FirstOrDefault(p => p.PedidoId == pedidoId);


      if (pedido == null)
      {
        return BadRequest("Pedido inexistente");
      }

      if (pedido.DataEmissao != null)
      {
        return BadRequest("Pedido já finalizado");
      }

      if (pedido.PedidoProdutos.Count == 0)
      {
        return BadRequest("Pedido não formulado");
      }

      bool precisaAtualizar = false;

      pedido.PedidoProdutos.ForEach(pp =>
      {
        if (pp.ValorUnitario != pp.Produto.Preco)
        {
          precisaAtualizar = true;
        }
        pp.ValorUnitario = pp.Produto.Preco;
      });

      if (precisaAtualizar)
      {
        var carrinhoDTO = PedidoDTO.FromPedido(pedido);
        _basedados.SaveChanges();
        return Conflict(new
        {
          menssagem = "Preços cadastrados no carrinho defasados",
          carrinho = carrinhoDTO,
        });
      }
      pedido.DataEmissao = DateTime.Now;

      var retorno = PedidoDTO.FromPedido(pedido);

      _basedados.SaveChanges();
      return retorno;
    }

    //PUT /pedidos/carrinho/adiciona/{:pedidoId}?produtoId={produtoId}
    [HttpPut]
    [Route("carrinho/adiciona/{pedidoId}")]
    public async Task<ActionResult<PedidoDTO>> AumentaQuantidade(
        int pedidoId,
        [FromQuery] int produtoId)
    {
      // Buscar pedido retornando os produtos associados (eager loading)
      var pedido = _basedados.Pedidos
          .Include(p => p.PedidoProdutos)
          .ThenInclude(pp => pp.Produto)
          .Include(p => p.Cliente)
          .FirstOrDefault(p => p.PedidoId == pedidoId);


      if (pedido == null)
      {
        return BadRequest("Pedido inexistente");
      }

      if (pedido.DataEmissao != null)
      {
        return BadRequest("Pedido já finalizado");
      }

      var produto = await _basedados.Produtos.FindAsync(produtoId);

      if (produto == null)
      {
        return BadRequest("Produto inexistente");
      }

      var pedprod = pedido.PedidoProdutos.Find(p => p.ProdutoId == produtoId);

      if (pedprod == null)
      {
        return BadRequest("Produto não inserido no carrinho");
      }

      pedprod.Quantidade++;

      await _basedados.SaveChangesAsync();

      return PedidoDTO.FromPedido(pedido);
    }

    //PUT /pedidos/carrinho/diminui/{:pedidoId}?produtoId={produtoId}
    [HttpPut]
    [Route("carrinho/diminui/{pedidoId}")]
    public async Task<ActionResult<PedidoDTO>> DiminuiQuantidade(
        int pedidoId,
        [FromQuery] int produtoId)
    {
      // Buscar pedido retornando os produtos associados (eager loading)
      var pedido = _basedados.Pedidos
          .Include(p => p.PedidoProdutos)
          .ThenInclude(pp => pp.Produto)
          .Include(p => p.Cliente)
          .FirstOrDefault(p => p.PedidoId == pedidoId);


      if (pedido == null)
      {
        return BadRequest("Pedido inexistente");
      }

      if (pedido.DataEmissao != null)
      {
        return BadRequest("Pedido já finalizado");
      }

      var produto = await _basedados.Produtos.FindAsync(produtoId);


      if (produto == null)
      {
        return BadRequest("Produto inexistente");
      }


      var pedprod = pedido.PedidoProdutos.Find(p => p.ProdutoId == produtoId);

      if (pedprod == null)
      {
        return BadRequest("Produto não inserido no carrinho");
      }

      if (pedprod.Quantidade <= 1)
      {
        return BadRequest("Quantidade menor que 1");
      }
      pedprod.Quantidade--;


      await _basedados.SaveChangesAsync();

      return PedidoDTO.FromPedido(pedido);
    }

    [HttpGet]
    [Route("carrinho/{pedidoId}")]
    public async Task<ActionResult<PedidoDTO>> BuscarCarrinho(int pedidoId)
    {
      //busca cliente
      var pedido = await _basedados.Pedidos
          .Include(p => p.PedidoProdutos)
          .ThenInclude(pp => pp.Produto)
          .Include(p => p.Cliente)
          .FirstOrDefaultAsync(p => p.PedidoId == pedidoId);

      if (pedido == null)
      {
        return BadRequest("Pedido inexistente");
      }

      if (pedido.DataEmissao != null)
      {
        return BadRequest("Pedido já finalizado");
      }

      // Atualiza o valor unitário de cada um dos produtos do pedido
      pedido.PedidoProdutos.ForEach(pp => pp.ValorUnitario = pp.Produto.Preco);

      await _basedados.SaveChangesAsync();

      return PedidoDTO.FromPedido(pedido);
    }

    [HttpDelete]
    [Route("carrinho/remove/{pedidoId}")]

    public async Task<ActionResult<PedidoDTO>> RemoveProduto(int pedidoId, [FromQuery] int produtoId)
    {

      var pedido = await _basedados.Pedidos
          .Include(p => p.PedidoProdutos)
          .ThenInclude(pp => pp.Produto)
          .Include(p => p.Cliente)
          .FirstOrDefaultAsync(p => p.PedidoId == pedidoId);

      if (pedido == null)
      {
        return BadRequest("Pedido inexistente");
      }

      if (pedido.DataEmissao != null)
      {
        return BadRequest("Pedido já finalizado");
      }

      var index = pedido.PedidoProdutos.FindIndex(p => p.ProdutoId == produtoId);

      if (index == -1)
      {
        return BadRequest("Produto não está no pedido.");
      }
      pedido.PedidoProdutos.RemoveAt(index);

      await _basedados.SaveChangesAsync();

      return PedidoDTO.FromPedido(pedido);
    }

  }
}


