using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetPals.Entities
{
    internal class CashDonation:Donation
    {
        public DateTime donationDate { get; set; }

        public CashDonation() { }
    }
}
