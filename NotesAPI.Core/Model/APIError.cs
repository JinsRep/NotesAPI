using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace NotesAPI.Core.Model
{
    public class APIError
    {
        [JsonProperty("message")]
        public string Message { get; set; }
    }
}
