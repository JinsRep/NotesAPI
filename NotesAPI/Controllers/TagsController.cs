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
    public class TagsController : ControllerBase
    {
        private readonly ITagRepository _tagRepository;

        public TagsController(ITagRepository tagRepository)
        {
            _tagRepository = tagRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var jsonData = await _tagRepository.GetAllTags();
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);

            }
            catch (Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Tag tag)
        {
            try
            {

                var jsonData = await _tagRepository.InsertTag(tag.Text.Trim());
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);
            }
            catch (Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }

        [Route("exists")]
        [HttpGet]
        public async Task<IActionResult> IsTagExists([FromQuery]string text="")
        {
            try
            {

                var jsonData = await _tagRepository.IsTagExists(text);
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);
            }
            catch (Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }
    }
}
