using RestClient.Net;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Urls;

namespace FolkaShop.Console
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            string baseUrl = "https://localhost:44300";

            using var client = new Client(baseUrl);

            var featuredProducts = await client.GetAsync<List<Product>>("api/featured-products");

            System.Console.WriteLine("List Featured Products");
            foreach (var p in featuredProducts.Body) System.Console.WriteLine(p.ProductName);

            System.Console.WriteLine();

            var categories = await client.GetAsync<List<Category>>("api/category");
            System.Console.WriteLine("Available Categories");
            foreach (var p in categories.Body) System.Console.WriteLine(p.CategoryName);

            System.Console.WriteLine();

            var productByCategory = await client.GetAsync<List<Product>>("api/product-by-category?categoryId=1");
            System.Console.WriteLine("Product By Category");
            foreach (var p in productByCategory.Body) System.Console.WriteLine(p.ProductName);
        }
    }
}
