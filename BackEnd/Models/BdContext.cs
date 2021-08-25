using Microsoft.EntityFrameworkCore;

namespace LojinhaIT13.Models
{
    public class BdContext : DbContext
    {
        public DbSet<Cliente> Clientes { get; set ;}
        public DbSet<Pedido> Pedidos { get; set; }
        public DbSet<Produto> Produtos { get; set; }
        public DbSet<Carrinho> Carrinhos { get; set; }
        public BdContext()
        {   
        }
        public BdContext (DbContextOptions<BdContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating (ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cliente>()
                        .Property(c => c.Nome)
                        .IsRequired()
                        .HasMaxLength(45);
            modelBuilder.Entity<Pedido>()
                        .HasMany(p => p.Produtos)
                        .WithMany(p => p.Pedidos)
                        .UsingEntity<PedidoProduto>(
                            juncao => juncao.HasOne(produto => produto.Produto)
                                    .WithMany(produto => produto.PedidoProdutos)
                                    .HasForeignKey(produto => produto.ProdutoId),
                            juncao => juncao .HasOne(pedido => pedido.Pedido)
                                    .WithMany(pedido => pedido.PedidoProdutos)
                                    .HasForeignKey(pedido => pedido.PedidoId),
                            juncao => 
                            {
                                juncao.HasKey(p => new { p.PedidoId, p.ProdutoId });
                            }
                        );
            modelBuilder.Entity<Carrinho>()
                        .HasMany(c => c.Produtos)
                        .WithMany(c => c.Carrinhos)
                        .UsingEntity<CarrinhoProduto>(
                            juncao => juncao.HasOne(cp => cp.Produto)
                                    .WithMany(p => p.CarrinhoProdutos)
                                    .HasForeignKey(cp => cp.ProdutoId),
                            juncao => juncao .HasOne(cp => cp.Carrinho)
                                    .WithMany(c => c.CarrinhoProdutos)
                                    .HasForeignKey(cp => cp.CarrinhoId),
                            juncao => 
                            {
                                juncao.HasKey(cp => new { cp.CarrinhoId, cp.ProdutoId });
                            }
                        );
        }
    }
}