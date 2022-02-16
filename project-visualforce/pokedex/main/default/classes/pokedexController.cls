public class pokedexController {
    public Pokemon pkmn { get; set; }
    public string pokeName {
        get {
            
            return this.pkmn.name.capitalize();
        }}
    public object pokeId {
        get{
            return this.pkmn.id;
        }}
    public object pokeWeight {
        get{
            return this.pkmn.weight;
        }}
    public object pokeHeight {
        get{
            return this.pkmn.height;
        }}
    public object pokeSprite {
        get{
            return this.pkmn.sprites.front_default;
        }}
    
    public object pokeType {
        get{
            List<String> types = new List<String>();
            for(Pokemon.cls_types type : this.pkmn.types) {
                types.add(type.type.name.capitalize());
            }
            
            return String.join(types, '/');
        }}
    public string noResults { get; set; }
    public boolean noResultsBoo { get; set; }
    public boolean renderValue { get; set; }
    
    public string inputValue {
        get {
            return inputValue;
        }
        set {
            inputValue = value;
            inputValue = inputValue.toLowerCase();
            this.pkmn = Pokemon.get(inputValue);
            this.renderValue = true;
            this.noResultsBoo = false;
            System.debug(this.pkmn);
            if (this.pkmn.id == null) {
                this.noResults =
                    'Sorry, your search "' +
                    value +
                    '" returned no Pokemon. Please check the spelling, or number you searched.';
                this.renderValue = false;
                this.noResultsBoo = true;
            }
        }
    }
    
    public pokedexController() {
        this.pkmn = Pokemon.get(1);
        this.renderValue = true;
        this.noResultsBoo = false;
    }
}