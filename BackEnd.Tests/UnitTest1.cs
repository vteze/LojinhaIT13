using Xunit;
using System;
using Microsoft.EntityFrameworkCore;
using LojinhaIT13.Models;
using System.Threading.Tasks;

namespace BackEnd.Tests
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            using (var db = new SqliteControllerTest())
            {

            }
        }
    }
}