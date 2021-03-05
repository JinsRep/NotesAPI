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
    public class ColorRepository : IColorRepository
    {
        private readonly IQueryPipe _queryPipe;

        public ColorRepository(IQueryPipe queryPipe)
        {
            this._queryPipe = queryPipe;
        }


        public async Task<string> GetAllColors()
        {
            SqlCommand cmd = new SqlCommand("dbo.usp_GetColors");
            cmd.CommandType = CommandType.StoredProcedure;
            StringBuilder jsonResult = new StringBuilder();
            using (StringWriter sw = new StringWriter(jsonResult))
            {
                await this._queryPipe.Sql(cmd).Stream(sw, "[]");
                return jsonResult.ToString();
            }
        }
    }
}
