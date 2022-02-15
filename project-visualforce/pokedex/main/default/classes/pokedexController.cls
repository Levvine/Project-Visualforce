public class pokedexController {
    public string pid {get;set;}
    public object pokemon {get;set;}
    public string pokeName {get;set;}
    public object name {get;set;}
    public object pokeId {get;set;}
    public object pokeWeight {get;set;}
    public object pokeHeight {get;set;}
    public object pokeSprite {get;set;}
    public string noResults {get;set;}
    public boolean noResultsBoo {get;set;}
    public string inputLowerCase {get;set;}
    public object pokeType {get;set;}
    public object pokeTypes {get;set;}
    public object pokeTypeClose {get;set;}
    public object pokeTypeFin {get;set;}
    public object pokeTypeFin2 {get;set;}
    public object pokeSpriteFin{get;set;}
    public string actualtype {get;set;}
    public string actualName {get;set;}
    public List<Object> poketypelist {get;set;}
    public string inputValue {get{return inputValue;}set{inputvalue = value; 
                                                         inputLowerCase = value.toLowerCase();
                                                         test = 'https://pokeapi.co/api/v2/pokemon/' + value;
                                                         Http http = new Http();
                                                         httpRequest request= new HttpRequest();
                                                         request.setEndpoint('https://pokeapi.co/api/v2/pokemon/'+inputLowerCase);
                                                         request.setMethod('GET');
                                                         HttpResponse response = http.send(request);
        if(response.getStatusCode()==200){
            pid = 'test will this work?';
            pokemon = response.getBody();
           	Map<String, Object> pokemap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
   			name =pokemap.get('name');
            actualName = 'Pokemon Name: ' + string.valueOf(name).capitalize();
            pokeId ='Pokedex Number: ' + pokemap.get('id');
            pokeWeight = 'Pokemon Weight: ' + pokemap.get('weight');
            pokeHeight = 'Pokemon Height: ' +pokemap.get('height');
            List<Object> pokelist = (List<Object>) pokemap.get('types');
            List<Object> poketypelist= new List<Object>();
            pokeType = pokemap.get('types');
            pokesprite = pokemap.get('sprites');
            Map<String, Object>pokeSpriteMap = (Map<String, Object>) pokesprite;
            pokespritefin= pokeSpriteMap.get('front_default');
            
            poketypes =pokelist[0];
    		Map<String, Object> pokemap2 = (Map<String, Object>) poketypes;
            pokeTypeClose = pokemap2.get('type');
            Map<String, Object>pokemap3 = (Map<String, Object>) pokeTypeClose;
            pokeTypeFin =pokemap3.get('name');
            actualtype = 'Pokemon Type: ' + string.valueOf(pokeTypeFin).capitalize();
            
            /*if(pokelist[1]!=null){
            object poketypes2 =pokelist[1];
            Map<String, Object> pokemap22 = (Map<String, Object>) poketypes2;
            object pokeTypeClose2 = pokemap22.get('type');
			Map<String, Object>pokemap32 = (Map<String, Object>) pokeTypeClose2;
            pokeTypeFin2 = pokemap32.get('name');
            }else{
                 poketypeFin2 = '';
            }*/
            
            renderValue = true;
            noResultsBoo = false;
        }else{
            noResults = 'Sorry, your search "'+value + '" returned no Pokemon. Please check the spelling, or number you searched.';
            renderValue = false;
            noResultsBoo = true;
        }
                                                        }}
    public string test {get;set;}
    public boolean renderValue {get;set;}
    public String requestURI {get; set;}
    public pokedexController(){
  		
    }
    public void populateDex(){
        /*inputValue='';
        renderValue = true;
        //test = 'https://pokeapi.co/api/v2/pokemon/' + inputValue;
        Http http = new Http();
        httpRequest request= new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/pokemon/1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()==200){
            pid = 'test will this work?';
            pokemon = response.getBody();
           	Map<String, Object> pokemap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
   			name = pokemap.get('name');
            pokeId = pokemap.get('id');
            pokeWeight = pokemap.get('weight');
            pokeHeight = pokemap.get('height');
            object pokeSprites = pokemap.get('sprites');
            //pokeSprite = pokemap.get('sprites');
        }*/
    }

    
}