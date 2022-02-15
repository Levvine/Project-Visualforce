public class VFBattleCustomController {
    
    //This is default data, replace with the commented map / param map getparameters code under it when ready for release.
    //string myTeam = 'a0017000008FmgbAAC';
    //string oppTeam = 'a0017000008FmgWAAS';
    Map<string, string> paramMap = apexPages.currentPage().getparameters();
    String myTeam = paramMap.get('myTeam');
    String oppTeam = paramMap.get('oppTeam');
    
    //retrieve home and away team names and pokemon lineup by Id.  returns pokemon as a number for lookup on pokeAPI
    Team__c home;
    Team__c away;
    
    public VFBattleCustomController() {
		System.debug('hello world');
        System.debug(paramMap);
        
        home = [
        SELECT Name, Id, Pokemon_1__c, Pokemon_2__c, Pokemon_3__c, Pokemon_4__c, Pokemon_5__c, Pokemon_6__c 
        FROM Team__c 
        WHERE Id = :myTeam];
        
        away = [
        SELECT Name, Id, Pokemon_1__c, Pokemon_2__c, Pokemon_3__c, Pokemon_4__c, Pokemon_5__c, Pokemon_6__c 
        FROM Team__c 
        WHERE Id = :oppTeam];
    }
    
    //creates string for displaying on VF page.  string is a list of the pokemon names based on the returned data from pokeAPI
    public string getTeamOnePoke(){
        string returnString;
        Pokemon poke1 = pokemon.get(integer.valueOf(home.Pokemon_1__c));
        Pokemon poke2 = pokemon.get(integer.valueOf(home.Pokemon_2__c));
        Pokemon poke3 = pokemon.get(integer.valueOf(home.Pokemon_3__c));
        Pokemon poke4 = pokemon.get(integer.valueOf(home.Pokemon_4__c));
        Pokemon poke5 = pokemon.get(integer.valueOf(home.Pokemon_5__c));
        Pokemon poke6 = pokemon.get(integer.valueOf(home.Pokemon_6__c));
        returnString = poke1.name + ', ' + poke2.name + ', ' + poke3.name + ', ' + poke4.name + ', ' + poke5.name + ', ' + poke6.name;
        if(returnString != null){
            return returnString;
        }else{
            return 'Pokemon = null';
        }
    }
    public string getTeamTwoPoke(){
        string returnString;
        Pokemon poke1 = pokemon.get(integer.valueOf(away.Pokemon_1__c));
        Pokemon poke2 = pokemon.get(integer.valueOf(away.Pokemon_2__c));
        Pokemon poke3 = pokemon.get(integer.valueOf(away.Pokemon_3__c));
        Pokemon poke4 = pokemon.get(integer.valueOf(away.Pokemon_4__c));
        Pokemon poke5 = pokemon.get(integer.valueOf(away.Pokemon_5__c));
        Pokemon poke6 = pokemon.get(integer.valueOf(away.Pokemon_6__c));
        returnString = poke1.name + ', ' + poke2.name + ', ' + poke3.name + ', ' + poke4.name + ', ' + poke5.name + ', ' + poke6.name;
        if(returnString != null){
            return returnString;
        }else{
            return 'Pokemon = null';
        }
    }
    //gets team names for VF page
    public string getTeamOne(){
        return home.name;
    }
    public string getTeamTwo(){
        return away.name;
    }
    
    
    //page reference for loading the victory screen with the "winner" team passed as Id
    public System.PageReference Battle(){
        integer intrandom = Integer.valueof((Math.random() * 2 ));
        PageReference HomeTeamWins = new PageReference('/apex/victoryPage?Winner=' + string.valueOf(home.id));
        PageReference AwayTeamWins = new PageReference('/apex/victoryPage?Winner=' + string.valueOf(away.id));
        
        if(intrandom == 1){
            return HomeTeamWins;
        }else{
            return AwayTeamWins; 
        }
    }
}
//a001F00000AGkrL
//a001F00000AGqf3