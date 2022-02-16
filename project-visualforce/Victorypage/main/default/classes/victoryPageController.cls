public class victoryPageController {

        Map<string, string> paramMap = apexPages.currentPage().getparameters();
        String winningTeam = paramMap.get('Winner');

        Team__c victor = [
            SELECT Name, Id, Pokemon_1__c, Pokemon_2__c, Pokemon_3__c, Pokemon_4__c, Pokemon_5__c, Pokemon_6__c 
            FROM Team__c 
            WHERE Id = :winningTeam];

        public string getWinningPoke(){
            string returnString;
            Pokemon poke1 = pokemon.get(integer.valueOf(victor.Pokemon_1__c));
            Pokemon poke2 = pokemon.get(integer.valueOf(victor.Pokemon_2__c));
            Pokemon poke3 = pokemon.get(integer.valueOf(victor.Pokemon_3__c));
            Pokemon poke4 = pokemon.get(integer.valueOf(victor.Pokemon_4__c));
            Pokemon poke5 = pokemon.get(integer.valueOf(victor.Pokemon_5__c));
            Pokemon poke6 = pokemon.get(integer.valueOf(victor.Pokemon_6__c));
            returnString = poke1.name.capitalize() + ', ' + 
                			poke2.name.capitalize() + ', ' + 
                			poke3.name.capitalize() + ', ' + 
                			poke4.name.capitalize() + ', ' + 
                			poke5.name.capitalize() + ', ' + 
                			poke6.name.capitalize();
            
            if(returnString != null){
                return returnString;
            }else{
                return 'Pokemon = null';
            }
        }

        public string getWinningTeam(){
            return victor.name;
        }
    
    	public string getWinningPokeImage(){
            string leadingZeroString;
            if (victor.Pokemon_1__c < 10)
            {
                leadingZeroString = '00' + victor.Pokemon_1__c;
            } else if (victor.Pokemon_1__c < 100){
                leadingZeroString = '0' + victor.Pokemon_1__c;
            } else leadingZeroString = '' + victor.Pokemon_1__c;
                
                
        	string returnString = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/' + leadingZeroString + '.png';
            return returnString;
           
    }
}