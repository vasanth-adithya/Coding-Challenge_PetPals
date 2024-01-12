using PetPals.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetPals.Dao
{
    internal interface IPetPalsRepo
    {
        //Methods for Pet class services
        void addPet(int petID, string petName, int petAge, string petBreed, string petType);
        void removePet(int petID);
        List<Pet> showAvailablePets();
        List<Pet> showAllPets();
        void recordCashDonation(int donationID, string donorName, double donationAmount);
        void recordItemDonation(int donationID, string donorName, string donationItem);
        void registerUser(int userID, string userName);
        void registerUserForEvent(int userID, int eventid, string participantName, string participantType);
        void adoptPet(int petid, int userid);
        List<AdoptionEvent> showAllEvents();
    }
}
