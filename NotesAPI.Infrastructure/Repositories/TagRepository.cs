using Belgrade.SqlClient;
using NotesAPI.Infrastructure.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace NotesAPI.Infrastructure.Repositories
{
    public class TagRepository : ITagRepository
    {

        private readonly IQueryPipe _queryPipe;

        public TagRepository(IQueryPipe queryPipe)
        {
            this._queryPipe = queryPipe;
        }

        public async Task<string> GetAllTags()
        {
            SqlCommand cmd = new SqlCommand("dbo.usp_GetTags");
            cmd.CommandType = CommandType.StoredProcedure;
            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "[]");
                return jsonResult.ToString();
            }
        }

        public async Task<string> InsertTag(string text)
        {
            SqlCommand cmd = new SqlCommand("dbo.usp_Insert_Tag");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TagText", text);
            
            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "{id:0}");
                return jsonResult.ToString();
            }
        }

        public async Task<string> IsTagExists(string text)
        {
            SqlCommand cmd = new SqlCommand("dbo.usp_IsTagExists");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TagText", text);

            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "{status:null}");
                return jsonResult.ToString();
            }
        }
    }
}
