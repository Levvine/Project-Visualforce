public class VFBattleExtension {
//URL PARAMS TO GET ?myTeam=recId&oppTeam=recId
    //https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/apex_System_PageReference_getParameters.htm
    //getParameters() returns a map
    //public map<string, string> getparameters()
    //pageReference.getParameters().put('Id', myID);
    //instantiate apexPages standard controller for list controller
    //https://www.forcetalks.com/blog/salesforce-rest-api-http-and-callout-basics-all-you-need-to-know/ REST CALLOUT INFO

    public ApexPages.StandardSetController setCon{
        get {
            //declare teams.  can alternatively get methods with ApexPages.currentPage().getParameters().get('urlParameterToGet');
            string myTeam;
            string oppTeam;
            //Map param id exploration
            Map<string, string> paramMap = apexPages.currentPage().getparameters();
            if(paramMap.containsKey('myTeam') && paramMap.containsKey('oppTeam')){
                myTeam = paramMap.get('myTeam');
                oppTeam = paramMap.get('oppTeam');
            }
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, Id, Pokemon_1__c, Pokemon_2__c, Pokemon_3__c, Pokemon_4__c, Pokemon_5__c, Pokemon_6__c 
                    FROM Team__c 
                    WHERE Id = :myTeam OR Id = :oppTeam ORDER BY Id]));
            }


            //attempted rest GET for the pokeAPI  //set pokeindex to swap between pokemon.
            string pokeIndex = '234';   //hardcode pokemon change to be based off of pokemon_x__c later
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://pokeapi.co/api/v2/pokemon/' + pokeIndex); //maybe a for(loop) of the pokemon_x__c values to get *all* pokemon
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            //if successful, parse json
            if(response.getStatusCode() == 200){
                //deserialize json string into collections of primitive data types.
                Map<String, Object> results  = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                system.debug('results: ' + results);
                //cast values as a list
                Map<string, Object> returnedInfo = (Map<string, object>) results.get('species');
                system.debug('Recieved following Name and URL: ' + returnedInfo);
                String PokeName = String.valueOf(returnedInfo.get('name'));
                String PokeUrl = String.valueOf(returnedInfo.get('url'));
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

        //logic test  data, loads a random web search engine.
        PageReference goog = new PageReference('http://www.google.com');
        PageReference ddg = new PageReference('https://www.duckduckgo.com');
        //determine coinflip winner, set page parameter to the Id of the winning team.
        //if homeTeam does not correctly set the recordId, use ApexPages.currentPage().getParameters().get(*page param to use*);
        if(intrandom == 1){
            return goog; //ApexPages.currentPage().getParameters().put('Winning Team', homeTeam);
        }else{
            return ddg; //ApexPages.currentPage().getParameters().put('Winning Team', oppTeam);   
        }
    }
}
//a001F00000AGkrL
//a001F00000AGqf3