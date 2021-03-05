using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace NotesAPI.Core.Model
{
    public class Tag
    {
        [JsonProperty("id")]
        public long Id { get; set; }

        [JsonProperty("text")]
        public string Text { get; set; }
    }
}
