using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace FolkaShop.Controllers
{
    [Route("api")]
    [ApiController]
    public class ProductController : Controller
    {
        Models.FolkaShopContext _context;

        public ProductController(Models.FolkaShopContext context)
        {
            _context = context;
        }

        [Route("featured-products")]
        [HttpGet]
        public async Task<IActionResult> FeaturedProductsAsync()
        {
            var products = await _context.Product.FromSqlRaw("exec prc_featured_products").ToListAsync();

            return Json(products);
        }


        [Route("product-by-category")]
        [HttpGet]
        public async Task<IActionResult> ProductByCategory([FromQuery]  int categoryId)
        {
            var products = await _context.Product.FromSqlRaw("exec prc_product_by_category {0}", categoryId).ToListAsync();

            return Json(products);
        }
    }
}
