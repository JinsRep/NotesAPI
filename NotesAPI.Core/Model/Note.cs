using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace NotesAPI.Core.Model
{
    public class Note
    {
        [JsonProperty("id")]
        public long Id { get; set; }

        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("color")]
        public NoteColor Color { get; set; }

        [JsonProperty("tags")]
        public Tag[] Tags { get; set; }
    }
}
