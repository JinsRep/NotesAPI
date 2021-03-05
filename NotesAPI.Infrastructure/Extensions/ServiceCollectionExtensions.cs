using Belgrade.SqlClient;
using Belgrade.SqlClient.SqlDb;
using Microsoft.Extensions.DependencyInjection;
using NotesAPI.Infrastructure.Interfaces;
using NotesAPI.Infrastructure.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace NotesAPI.Infrastructure.Extensions
{
    public static class ServiceCollectionExtensions
    {
        public static void AddRepositoryServices(this IServiceCollection services,string connectonString)
        {
            services.AddTransient<IQueryPipe>(_ =>
            {
                return new QueryPipe(connectonString);
            });

            services.AddTransient<INoteRepository, NoteRepository>();
            services.AddTransient<ITagRepository, TagRepository>();
            services.AddTransient<IColorRepository, ColorRepository>();
        }
    }
}
