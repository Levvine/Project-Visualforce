public with sharing class PreviousTeamEditDeleteController_CC{
    
	public List<Team__c> teams { get; set; }
  
   //used to get a hold of the team record selected for deletion
   public string SelectedTeamId { get; set; }
  
   public PreviousTeamEditDeleteController_CC() {
       //load team data into our DataTable
       LoadData();
   }
  
   private void LoadData() {
       teams = [SELECT id, Name, Pokemon_1__c,Pokemon_2__c,Pokemon_3__c,Pokemon_4__c,Pokemon_5__c,Pokemon_6__c,Team_Win__c, Team_Loss__c FROM Team__c limit 20];
   }
  
   public void DeleteTeam()
   {
      // if for any reason we are missing the reference 
      if (SelectedTeamId == null) {
      
         return;
      }
     
      // find the team record within the collection
      Team__c tobeDeleted = null;
      for(Team__c tea : teams)
       if (tea.Id == SelectedTeamId) {
          tobeDeleted = tea;
          break;
       }
      
      //if team record found delete it
      if (tobeDeleted != null) {
       Delete tobeDeleted;
      }
     
      //refresh the data
      LoadData();
   }    
  
  
}