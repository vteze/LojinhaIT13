using System.Collections.Concurrent;
using System.Collections.Generic;
using LojinhaIT13.Dtos;
using LojinhaIT13.Models;
using LojinhaIT13.Controllers;

namespace LojinhaIT13.Service
{
    public class CarrinhoService
    {
        public readonly ConcurrentDictionary<Cliente, IEnumerable<ProdutoDTO>> _carrinho = new ConcurrentDictionary<Cliente, IEnumerable<ProdutoDTO>>();

    }
}