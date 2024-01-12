using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using PetPals.Entities;
using PetPals.Util;

namespace PetPals.Dao
{
    internal class ItemDonation : Donation
    {
        SqlConnection conn;
        SqlCommand cmd = null;

        public ItemDonation()
        {
            conn = DBConnUtil.GetConnection();
            cmd = new SqlCommand();
            Date = DateTime.Now;
        }
        public string ItemType { get; set; }


        public override string RecordDonation()
        {
            string response = null;
            try
            {
                using (conn)
                {
                    cmd.CommandText = "insert into Donations  (DonorName, DonationType, DonationItem, DonationDate) OUTPUT INSERTED.DonationID values(@name, @type, @item, @date)";
                    cmd.Parameters.AddWithValue("@name", DonorName);
                    string donationType = "Item";
                    cmd.Parameters.AddWithValue("@type", donationType);
                    cmd.Parameters.AddWithValue("@item", ItemType);
                    cmd.Parameters.AddWithValue("@date", Date);

                    cmd.Connection = conn;
                    conn.Open();
                    object NewId = cmd.ExecuteScalar();
                    if (NewId != null)
                    {
                        response = "Thank you for donating the Item : " + ItemType;
                    }
                    else
                        response = "Something went wrong";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine();
                Console.WriteLine(ex.Message);
                Console.Write("\nReturning to previous menu...");
                Thread.Sleep(2000);
            }
            return response;
        }
    }
}
