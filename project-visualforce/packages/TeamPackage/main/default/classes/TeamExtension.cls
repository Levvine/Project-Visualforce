public class TeamExtension {

    private final Team__c theTeam{
        get{return theTeam;}
        set{theTeam = value;}
    }

    public String pokemon1{
        get{return pokemon1;}
        set{pokemon1 = value;}
    }
    public String pokemon2{
        get{return pokemon2;}
        set{pokemon2 = value;}
    }
    public String pokemon3{
        get{return pokemon3;}
        set{pokemon3 = value;}
    }
    public String pokemon4{
        get{return pokemon4;}
        set{pokemon4 = value;}
    }
    public String pokemon5{
        get{return pokemon5;}
        set{pokemon5 = value;}
    }
    public String pokemon6{
        get{return pokemon6;}
        set{pokemon6 = value;}
    }
    
    public List<SelectOption> pokeListString{
        get{
            return pokeListString;
        }
        set;
    }
    
    public PageReference selectPokemon() {
        saveTeam();
        return null;
    }
    
    public TeamExtension(ApexPages.StandardController stdController) 
    {
        this.theTeam = (Team__c)stdController.getRecord();
        pokeListString = new List<SelectOption>();
        myCallout();
    }
    
    public void myCallout()
    {
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://pokeapi.co/api/v2/pokemon?limit=898');
        request.setMethod('GET');
        HttpResponse response = h.send(request);
        
        Map<String, Object> responseBodyMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        
        List<Object> pokeList = (List<Object>) responseBodyMap.get('results');
        
        List<Map<String, Object>> pokeListMap = new List<Map<String, Object>>();
        
        for(object poke :pokeList)
        {
            pokeListMap.add((Map<String, Object>) poke);
        }
            system.debug(pokeListMap);
            
        for(Map<String, Object> poke : pokeListMap)
        {
            pokeListString.add(new SelectOption((String)poke.get('name'), (String)poke.get('name')));
            //system.debug(pokeListString);
        }
    }
    
    public void saveTeam()
    {        
        this.theTeam.Pokemon_1__c = getPokeIndex(pokemon1);
        this.theTeam.Pokemon_2__c = getPokeIndex(pokemon2);
        this.theTeam.Pokemon_3__c = getPokeIndex(pokemon3);
        this.theTeam.Pokemon_4__c = getPokeIndex(pokemon4);
        this.theTeam.Pokemon_5__c = getPokeIndex(pokemon5);
        this.theTeam.Pokemon_6__c = getPokeIndex(pokemon6);

    }
    
    public integer getPokeIndex(string name)
    {
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://pokeapi.co/api/v2/pokemon/' + name);
        request.setMethod('GET');
        HttpResponse response = h.send(request);
        
        //system.debug((response.getBody()));
        
        Map<String, Object> responseBodyMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

        //system.debug((integer)responseBodyMap.get('id'));
        return (integer)responseBodyMap.get('id');
    }
}