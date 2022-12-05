using Microsoft.AspNetCore.Mvc;

public class PrincipalController : Controller
{
    public IActionResult Index()
    {
        //return Content("<h1>Página Dinâmica</h1>", "text/html; charset=utf-8");
        return View();
    }
    public IActionResult Contato()
    {
        return View();
    }
}