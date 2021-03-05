using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NotesAPI.Core.Model;
using NotesAPI.Infrastructure.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NotesAPI.Controllers
{
    [EnableCors("CORSPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class ColorsController : ControllerBase
    {
        private readonly IColorRepository _colorRepository;

        public ColorsController(IColorRepository colorRepository)
        {
            _colorRepository = colorRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var jsonData = await _colorRepository.GetAllColors();
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);

            }
            catch (Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }
    }
}
