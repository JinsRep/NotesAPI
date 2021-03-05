using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NotesAPI.Infrastructure.Interfaces
{
    public interface ITagRepository
    {
        Task<string> GetAllTags();
        Task<string> IsTagExists(string text);
        Task<string> InsertTag(string text);
    }
}
