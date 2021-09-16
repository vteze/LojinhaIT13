using Microsoft.EntityFrameworkCore;
using LojinhaIT13.Models;
using System.Threading.Tasks;

namespace BackEnd.Tests
{
    public class TestingController
    {
        protected TestingController(DbContextOptions<BdContext> contextOptions)
        {
            ContextOptions = contextOptions;

            Task.Run(() => this.Seed()).Wait();
        }

        protected DbContextOptions<BdContext> ContextOptions { get; }

        private async Task Seed()
        {
            using (var BdTeste = new BdContext(ContextOptions))
            {
                BdTeste.Database.EnsureDeleted();
                BdTeste.Database.EnsureCreated();

                using (var BdOriginal = new BdContext())
                {
                    var pedidos = BdOriginal.Pedidos
                        .AsNoTracking()
                        .Include(p => p.PedidoProdutos)
                        .ThenInclude(pp => pp.Produto)
                        .Include(p => p.Cliente);

                    var clientes = BdOriginal.Clientes
                        .AsNoTracking()
                        .Include(c => c.Pedidos)
                        .ThenInclude(p => p.PedidoProdutos)
                        .ThenInclude(pp => pp.Produto);

                    var produtos = BdOriginal.Produtos
                        .AsNoTracking()
                        .Include(p => p.PedidoProdutos)
                        .ThenInclude(pp => pp.Pedido);

                    await pedidos.ForEachAsync(p => BdTeste.Pedidos.AddAsync(p));
                    await clientes.ForEachAsync(c => BdTeste.Clientes.AddAsync(c));
                    await produtos.ForEachAsync(p => BdTeste.Produtos.AddAsync(p));
                }

                await BdTeste.SaveChangesAsync();
            }
        }
    }
}