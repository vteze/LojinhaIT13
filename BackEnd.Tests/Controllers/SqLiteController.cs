using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using LojinhaIT13.Models;
using System.Data.Common;
using System.Data.SQLite;
using System;


namespace BackEnd.Tests
{
    public class SqliteControllerTest : TestingController, IDisposable
    {
        private readonly DbConnection _connection;

        public SqliteControllerTest()
            : base(
                new DbContextOptionsBuilder<BdContext>()
                    .UseSqlite(CreateInMemoryDatabase())
                    .Options)
        {
            _connection = RelationalOptionsExtension.Extract(ContextOptions).Connection;
        }

        private static DbConnection CreateInMemoryDatabase()
        {
            var connection = new SqliteConnection("Filename=:memory:");

            connection.Open();

            return connection;
        }


        public void Dispose() => _connection.Dispose();
    }
}