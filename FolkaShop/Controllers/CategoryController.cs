using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace FolkaShop.Controllers
{
    [Route("api/category")]
    [ApiController]
    public class CategoryController : Controller
    {
        Models.FolkaShopContext _context;

        public CategoryController(Models.FolkaShopContext context)
        {
            _context = context;
        }

       
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var products = await _context.Category.FromSqlRaw("exec prc_all_categories").ToListAsync();

            return Json(products);
        }
    }
}
