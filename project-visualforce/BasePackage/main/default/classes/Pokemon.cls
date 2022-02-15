public class Pokemon {
	public cls_abilities[] abilities;
	public Integer base_experience;	//64
	public cls_forms[] forms;
	public cls_game_indices[] game_indices;
	public Integer height;	//7
	public cls_held_items[] held_items;
	public Integer id;	//1
	public boolean is_default;
	public String location_area_encounters;	//https://pokeapi.co/api/v2/pokemon/1/encounters
	public cls_moves[] moves;
	public String name;	//bulbasaur
	public Integer order;	//1
	public cls_past_types[] past_types;
	public cls_species species;
    public cls_sprites sprites;
	public cls_stats[] stats;
	public cls_types[] types;
	public Integer weight;	//69
	class cls_abilities {
		public cls_ability ability;
		public boolean is_hidden;
		public Integer slot;	//1
	}
	class cls_ability {
		public String name;	//overgrow
		public String url;	//https://pokeapi.co/api/v2/ability/65/
	}
	class cls_forms {
		public String name;	//bulbasaur
		public String url;	//https://pokeapi.co/api/v2/pokemon_form/1/
	}
	class cls_game_indices {
		public Integer game_index;	//153
		public cls_version version;
	}
	class cls_version {
		public String name;	//red
		public String url;	//https://pokeapi.co/api/v2/version/1/
	}
	class cls_held_items {
	}
	class cls_moves {
		public cls_move move;
		public cls_version_group_details[] version_group_details;
	}
	class cls_move {
		public String name;	//razor_wind
		public String url;	//https://pokeapi.co/api/v2/move/13/
	}
	class cls_version_group_details {
		public Integer level_learned_at;	//0
		public cls_move_learn_method move_learn_method;
		public cls_version_group version_group;
	}
	class cls_move_learn_method {
		public String name;	//egg
		public String url;	//https://pokeapi.co/api/v2/move_learn_method/2/
	}
	class cls_version_group {
		public String name;	//gold_silver
		public String url;	//https://pokeapi.co/api/v2/version_group/3/
	}
	class cls_past_types {
	}
	class cls_species {
		public String name;	//bulbasaur
		public String url;	//https://pokeapi.co/api/v2/pokemon_species/1/
	}
	class cls_sprites {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png
		public String back_female;
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png
		public String back_shiny_female;
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png
		public String front_shiny_female;
		public cls_other other;
		public cls_versions versions;
	}
	class cls_other {
		public cls_dream_world dream_world;
		public cls_home home;
		public cls_official_artwork official_artwork;
	}
	class cls_dream_world {
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream_world/1.svg
		public String front_female;
	}
	class cls_home {
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png
		public String front_shiny_female;
	}
	class cls_official_artwork {
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official_artwork/1.png
	}
	class cls_versions {
		public cls_generation_i generation_i;
		public cls_generation_ii generation_ii;
		public cls_generation_iii generation_iii;
		public cls_generation_iv generation_iv;
		public cls_generation_v generation_v;
		public cls_generation_vi generation_vi;
		public cls_generation_vii generation_vii;
		public cls_generation_viii generation_viii;
	}
	class cls_generation_i {
		public cls_red_blue red_blue;
		public cls_yellow yellow;
	}
	class cls_red_blue {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/red_blue/back/1.png
		public String back_gray;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/red_blue/back/gray/1.png
		public String back_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/red_blue/transparent/back/1.png
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/red_blue/1.png
		public String front_gray;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/red_blue/gray/1.png
		public String front_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/red_blue/transparent/1.png
	}
	class cls_yellow {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/yellow/back/1.png
		public String back_gray;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/yellow/back/gray/1.png
		public String back_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/yellow/transparent/back/1.png
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/yellow/1.png
		public String front_gray;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/yellow/gray/1.png
		public String front_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_i/yellow/transparent/1.png
	}
	class cls_generation_ii {
		public cls_crystal crystal;
		public cls_gold gold;
		public cls_silver silver;
	}
	class cls_crystal {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/crystal/back/1.png
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/crystal/back/shiny/1.png
		public String back_shiny_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/crystal/transparent/back/shiny/1.png
		public String back_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/crystal/transparent/back/1.png
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/crystal/1.png
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/crystal/shiny/1.png
		public String front_shiny_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/crystal/transparent/shiny/1.png
		public String front_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/crystal/transparent/1.png
	}
	class cls_gold {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/gold/back/1.png
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/gold/back/shiny/1.png
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/gold/1.png
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/gold/shiny/1.png
		public String front_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/gold/transparent/1.png
	}
	class cls_silver {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/silver/back/1.png
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/silver/back/shiny/1.png
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/silver/1.png
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/silver/shiny/1.png
		public String front_transparent;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_ii/silver/transparent/1.png
	}
	class cls_generation_iii {
		public cls_emerald emerald;
		public cls_firered_leafgreen firered_leafgreen;
		public cls_ruby_sapphire ruby_sapphire;
	}
	class cls_emerald {
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/emerald/1.png
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/emerald/shiny/1.png
	}
	class cls_firered_leafgreen {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/firered_leafgreen/back/1.png
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/firered_leafgreen/back/shiny/1.png
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/firered_leafgreen/1.png
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/firered_leafgreen/shiny/1.png
	}
	class cls_ruby_sapphire {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/ruby_sapphire/back/1.png
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/ruby_sapphire/back/shiny/1.png
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/ruby_sapphire/1.png
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iii/ruby_sapphire/shiny/1.png
	}
	class cls_generation_iv {
		public cls_diamond_pearl diamond_pearl;
		public cls_heartgold_soulsilver heartgold_soulsilver;
		public cls_platinum platinum;
	}
	class cls_diamond_pearl {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/diamond_pearl/back/1.png
		public String back_female;
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/diamond_pearl/back/shiny/1.png
		public String back_shiny_female;
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/diamond_pearl/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/diamond_pearl/shiny/1.png
		public String front_shiny_female;
	}
	class cls_heartgold_soulsilver {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/heartgold_soulsilver/back/1.png
		public String back_female;
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/heartgold_soulsilver/back/shiny/1.png
		public String back_shiny_female;
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/heartgold_soulsilver/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/heartgold_soulsilver/shiny/1.png
		public String front_shiny_female;
	}
	class cls_platinum {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/platinum/back/1.png
		public String back_female;
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/platinum/back/shiny/1.png
		public String back_shiny_female;
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/platinum/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_iv/platinum/shiny/1.png
		public String front_shiny_female;
	}
	class cls_generation_v {
		public cls_black_white black_white;
	}
	class cls_black_white {
		public cls_animated animated;
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_v/black_white/back/1.png
		public String back_female;
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_v/black_white/back/shiny/1.png
		public String back_shiny_female;
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_v/black_white/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_v/black_white/shiny/1.png
		public String front_shiny_female;
	}
	class cls_animated {
		public String back_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_v/black_white/animated/back/1.gif
		public String back_female;
		public String back_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_v/black_white/animated/back/shiny/1.gif
		public String back_shiny_female;
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_v/black_white/animated/1.gif
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_v/black_white/animated/shiny/1.gif
		public String front_shiny_female;
	}
	class cls_generation_vi {
		public cls_omegaruby_alphasapphire omegaruby_alphasapphire;
		public cls_x_y x_y;
	}
	class cls_omegaruby_alphasapphire {
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_vi/omegaruby_alphasapphire/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_vi/omegaruby_alphasapphire/shiny/1.png
		public String front_shiny_female;
	}
	class cls_x_y {
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_vi/x_y/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_vi/x_y/shiny/1.png
		public String front_shiny_female;
	}
	class cls_generation_vii {
		public cls_icons icons;
		public cls_ultra_sun_ultra_moon ultra_sun_ultra_moon;
	}
	class cls_icons {
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_viii/icons/1.png
		public String front_female;
	}
	class cls_ultra_sun_ultra_moon {
		public String front_default;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_vii/ultra_sun_ultra_moon/1.png
		public String front_female;
		public String front_shiny;	//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation_vii/ultra_sun_ultra_moon/shiny/1.png
		public String front_shiny_female;
	}
	class cls_generation_viii {
		public cls_icons icons;
	}
	class cls_stats {
		public Integer base_stat;	//45
		public Integer effort;	//0
		public cls_stat stat;
	}
	class cls_stat {
		public String name;	//hp
		public String url;	//https://pokeapi.co/api/v2/stat/1/
	}
	class cls_types {
		public Integer slot;	//1
		public cls_type type;
	}
	class cls_type {
		public String name;	//grass
		public String url;	//https://pokeapi.co/api/v2/type/12/
	}
	public static Pokemon parse(String json){
		return (Pokemon) System.JSON.deserialize(json, Pokemon.class);
	}
    
    public static Pokemon get(Integer index) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/pokemon/' + index);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //if successful, parse json
        Pokemon pkmn = new Pokemon();
        if(response.getStatusCode() == 200){
            pkmn = Pokemon.parse(response.getBody());
        }
        return pkmn;
    }
}
