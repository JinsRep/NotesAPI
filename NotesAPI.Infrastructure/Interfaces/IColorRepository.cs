using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NotesAPI.Infrastructure.Interfaces
{
    public interface IColorRepository
    {
        Task<string> GetAllColors();
    }
}
