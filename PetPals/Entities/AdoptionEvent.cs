﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace PetPals.Entities
{
    internal class AdoptionEvent
    {
        public int EventID { get; set; }
        public string EventName { get; set; }
        public DateTime EventDate { get; set; }
        public string Location { get; set; }

        public override string ToString()
        {
            return $"Event ID : {EventID}\n Name: {EventName}\n Date: {EventDate}\n Location: {Location}\n\n";
        }
    }
}