using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace NotesAPI.Core.Model
{
    public class NoteColor
    {
        [JsonProperty("id")]
        public int Id { get; set; }

        [JsonProperty("display")]
        public string ColorDisplay { get; set; }

        [JsonProperty("code")]
        public string ColorCode { get; set; }
    }
}
