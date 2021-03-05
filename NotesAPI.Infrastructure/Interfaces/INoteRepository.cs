using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace NotesAPI.Infrastructure.Interfaces
{
    public interface INoteRepository
    {
        Task<string> GetNotes(string tag, string colorName, string word);
        Task<string> GetNoteById(long Id);
        Task<string> InsertNote(string title, string text, int colorId, string tagIds);
        Task<string> UpdateNote(long Id,string title, string text, int colorId, string tagIds);
        Task<string> DeleteNote(long Id);
    }
}
