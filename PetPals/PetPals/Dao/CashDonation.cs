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
    internal class CashDonation : Donation
    {
        SqlConnection conn;
        SqlCommand cmd = null;

        public CashDonation() 
        {
            conn = DBConnUtil.GetConnection();
            cmd = new SqlCommand();
            Date = DateTime.Now;
        }
        public double Amount { get; set; }


        public override string RecordDonation()
        {
            string response = null;
            try
            {
                using (conn)
                {
                    cmd.CommandText = "insert into Donations  (DonorName, DonationType, DonationAmount, DonationDate) OUTPUT INSERTED.DonationID values(@name, @type, @cash, @date)";
                    cmd.Parameters.AddWithValue("@name", DonorName);
                    string donationType = "Cash";
                    cmd.Parameters.AddWithValue("@type", donationType);
                    cmd.Parameters.AddWithValue("@cash", Amount);
                    cmd.Parameters.AddWithValue("@date", Date);

                    cmd.Connection = conn;
                    conn.Open();
                    object NewId = cmd.ExecuteScalar();
                    if (NewId != null)
                    {
                        response = "Thank you for donating the Cash : " + Amount;
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
