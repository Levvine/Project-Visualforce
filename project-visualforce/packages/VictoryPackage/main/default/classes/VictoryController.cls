public class VictoryController {

        Map<string, string> paramMap = apexPages.currentPage().getparameters();
        String winningTeam = paramMap.get('Winner');

        Team__c victor = [
            SELECT Name, Id, Pokemon_1__c, Pokemon_2__c, Pokemon_3__c, Pokemon_4__c, Pokemon_5__c, Pokemon_6__c 
            FROM Team__c 
            WHERE Id = :winningTeam];

        public string getWinningPoke(){
            string returnString;
            List<String> names = new List<String>();
            Pokemon poke1;
            Pokemon poke2;
            Pokemon poke3;
            Pokemon poke4;
            Pokemon poke5;
            Pokemon poke6;
            System.debug(victor);

            //System.debug(returnString);
            if (victor.Pokemon_1__c != null) {
                poke1 = pokemon.get(integer.valueOf(victor.Pokemon_1__c));
                names.add(poke1.name.capitalize());
            } 
            if (victor.Pokemon_2__c != null) {
                
                poke2 = pokemon.get(integer.valueOf(victor.Pokemon_2__c));
                names.add(poke2.name.capitalize());
                
            } 
            if (victor.Pokemon_3__c != null) {
                poke3 = pokemon.get(integer.valueOf(victor.Pokemon_3__c));
                names.add(poke3.name.capitalize());
            } 
            if (victor.Pokemon_4__c != null) {
                poke4 = pokemon.get(integer.valueOf(victor.Pokemon_4__c));
                names.add(poke4.name.capitalize());
            } 
            if (victor.Pokemon_5__c != null) {
                poke5 = pokemon.get(integer.valueOf(victor.Pokemon_5__c));
                names.add(poke5.name.capitalize());
            } 
            if (victor.Pokemon_6__c != null) {
                poke6 = pokemon.get(integer.valueOf(victor.Pokemon_6__c));
                names.add(poke6.name.capitalize());
            }
            returnString = String.join(names, ', ');
            
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