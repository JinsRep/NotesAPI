using Belgrade.SqlClient;
using Belgrade.SqlClient.SqlDb;
using NotesAPI.Infrastructure.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace NotesAPI.Infrastructure.Repositories
{
    public class NoteRepository : INoteRepository
    {

        private readonly IQueryPipe _queryPipe;

        public NoteRepository(IQueryPipe queryPipe)
        {
            this._queryPipe = queryPipe;
        }

 

        public async Task<string> GetNoteById(long Id)
        {
            SqlCommand cmd = new SqlCommand("dbo.usp_GetNoteById");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("NoteId", Id);
            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "{id:0}");
                return jsonResult.ToString();
            }
        }

        public async Task<string> GetNotes(string tag, string colorName, string word)
        {

            SqlCommand cmd = new SqlCommand("dbo.usp_Get_Notes");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Tag", tag);
            cmd.Parameters.AddWithValue("Color", colorName);
            cmd.Parameters.AddWithValue("SearchKey", word);
            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "[]");
                return jsonResult.ToString();
            }
        }

        public async Task<string> InsertNote(string title, string text, int colorId, string tagIds)
        {
            SqlCommand cmd = new SqlCommand("dbo.usp_Insert_Note");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Title", title);
            cmd.Parameters.AddWithValue("Text", text);
            cmd.Parameters.AddWithValue("ColorId", colorId);
            cmd.Parameters.AddWithValue("TagIds", tagIds);

            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "{id:0}");
                return jsonResult.ToString();
            }
        }

        public async Task<string> UpdateNote(long Id, string title, string text, int colorId, string tagIds)
        {
            SqlCommand cmd = new SqlCommand("dbo.usp_Update_Note");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("NoteId", Id);
            cmd.Parameters.AddWithValue("Title", title);
            cmd.Parameters.AddWithValue("Text", text);
            cmd.Parameters.AddWithValue("ColorId", colorId);
            cmd.Parameters.AddWithValue("TagIds", tagIds);

            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "{id:0}");
                return jsonResult.ToString();
            }
        }

        public async Task<string> DeleteNote(long Id)
        {
            SqlCommand cmd = new SqlCommand("dbo.usp_DeleteNoteById");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("NoteId", Id);
           

            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "{id:0}");
                return jsonResult.ToString();
            }
        }
    }
}
