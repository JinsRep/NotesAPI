using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NotesAPI.Core.Model;
using NotesAPI.Infrastructure.Interfaces;

namespace NotesAPI.Controllers
{
    [EnableCors("CORSPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class NotesController : ControllerBase
    {
        private readonly INoteRepository _noteRepository;

        public NotesController(INoteRepository noteRepository)
        {
            _noteRepository = noteRepository;
        }


        [HttpGet]
        public async Task<IActionResult> Get([FromQuery]string tag = "",string color="" ,string word = "")
        {
            try
            {
                if(tag.ToLower() == "all") { tag = ""; }
                if(color.ToLower() == "all") { color = ""; }
                var jsonData = await _noteRepository.GetNotes(tag, color, word);
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);

            }catch(Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }

        [HttpGet]
        [Route("{Id}")]
        public async Task<IActionResult> GetById([FromRoute]long Id)
        {
            try
            {
                var jsonData = await _noteRepository.GetNoteById(Id);
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);

            }
            catch (Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody]Note note)
        {
            try
            {
                string tagIds = string.Format("[{0}]",
                    note.Tags != null && note.Tags.Length > 0 ?
                    string.Join(',', note.Tags.Select(t => t.Id).ToArray()) :
                    "");
                var jsonData = await _noteRepository.InsertNote(note.Title, note.Text, note.Color.Id, tagIds);
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);
            }
            catch(Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }

        [HttpPut]
        [Route("{Id}")]
        public async Task<IActionResult> Update([FromRoute] long Id,[FromBody]Note note)
        {
            try
            {
                string tagIds = string.Format("[{0}]",
                   note.Tags != null && note.Tags.Length > 0 ?
                   string.Join(',', note.Tags.Select(t => t.Id).ToArray()) :
                   "");
                var jsonData = await _noteRepository.UpdateNote(Id,note.Title, note.Text, note.Color.Id, tagIds);
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);
            }
            catch (Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }

        [HttpDelete]
        [Route("{Id}")]
        public async Task<IActionResult> Delete([FromRoute] long Id)
        {
            try
            {
                var jsonData = await _noteRepository.DeleteNote(Id);
                return Content(jsonData, "application/json", System.Text.Encoding.UTF8);
            }
            catch (Exception ex)
            {
                return BadRequest(new APIError { Message = ex.Message });
            }
        }
    }
}
