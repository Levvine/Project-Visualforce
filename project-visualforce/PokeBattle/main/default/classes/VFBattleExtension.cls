public class VFBattleExtension {

    
//URL PARAMS TO GET ?myTeam=recId&oppTeam=recId


    //https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/apex_System_PageReference_getParameters.htm
    //getParameters() returns a map
    //public map<string, string> getparameters()
    //pageReference.getParameters().put('Id', myID);


    //instantiate apexPages standard controller for list controller
    public ApexPages.StandardSetController setCon{
        get {
            string homeTeam = 'a001F00000AGkrL';	//ApexPages.currentPage().getParameters().get('myTeam');  //recieve the home team recordId to be used to load the home team lineup. 
            string oppTeam = 'a001F00000AGqf3';	//ApexPages.currentPage().getParameters().get('oppTeam');

            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, Id, Pokemon_1__c, Pokemon_2__c, Pokemon_3__c, Pokemon_4__c, Pokemon_5__c, Pokemon_6__c 
                    FROM Team__c 
                    WHERE Id = :homeTeam OR Id = :oppTeam]));
            }
            return setCon;
        }
        set;
    }

    //initialize setcon and return a list of records
    Public List<Team__c> getTeams(){
        return (List<Team__c>) setCon.getRecords(); 
    }


    public System.PageReference Battle(){
        integer intrandom = Integer.valueof((Math.random() * 2 ));  //get random between 1 and 2
        PageReference goog = new PageReference('http://www.google.com');
        PageReference ddg = new PageReference('https://www.duckduckgo.com');
        //determine coinflip winner, set page parameter to the Id of the winning team.
        if(intrandom == 1){
            return goog; //ApexPages.currentPage().getParameters().get('myTeam');
        }else{
            return ddg; //ApexPages.currentPage().getParameters().get('oppTeam');   
        }
    }
}
//a001F00000AGkrL
//a001F00000AGqf3