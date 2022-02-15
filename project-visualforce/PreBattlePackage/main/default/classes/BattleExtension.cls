public class BattleExtension {
    
    final ApexPages.StandardController stdController;
    final Battle__c battle;
    public String opponent { get; set; }
    public String opponentHelpText { get; private set; }
    public String opponentURL { get; set; }
    public Boolean showOpponentURL { 
        get {
            return (opponent == FROM_URL);
        }
    }
    
    public static final String RANDOM = 'Random';
    public static final String FROM_URL = 'From URL';
    
    public BattleExtension(ApexPages.StandardController stdController) {
        this.stdController = stdController;
        this.battle = (Battle__c) stdController.getRecord();
        this.battle.Host__c = '0031700001KRXCMAA5'; // hardcoding id works
        this.opponent = RANDOM;
        this.opponentHelpText = 'Select an opposing team source.';
        this.opponentURL = '';
    }
    
    public List<SelectOption> getOpponentOptions() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption(RANDOM, RANDOM)); 
        options.add(new SelectOption(FROM_URL, FROM_URL)); 
        return options; 
    }
    
    public PageReference refresh() {
        System.debug(ApexPages.currentPage().getParameters().get('retURL'));
        return null;
    }
    
    public PageReference save() {
        // Check if HostTeam was selected properly
        if (this.battle.HostTeam__c == null) {
            return null;
        }
        if (opponent == RANDOM) {
            Team__c oppTeam = new Team__c(
                Name = 'Random',
                Pokemon_1__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                Pokemon_2__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                Pokemon_3__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                Pokemon_4__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                Pokemon_5__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                Pokemon_6__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1)
            );
            insert oppTeam;
            this.battle.GuestTeam__c = oppTeam.Id;
        } else if (opponent == FROM_URL) {
            try { 
                Http http = new Http();
                HttpRequest request = new HttpRequest();
                request.setEndpoint(opponentURL);
                request.setMethod('GET');
                HttpResponse response = http.send(request);
                Object resBody = JSON.deserializeUntyped(response.getBody());
                Map<String, Object> resMap = (Map<String, Object>) resBody;
                resMap.remove('Id');
                
                SObject oppTeam = SiteUtils.createSObject('Team__c', resMap);
                insert oppTeam;
                
                this.battle.GuestTeam__c = oppTeam.Id;
            } catch (CalloutException e) {
                System.debug(e);
            }
        }
        String myTeamStr = String.valueOf(this.battle.HostTeam__c);
        String oppTeamStr = String.valueOf(this.battle.GuestTeam__c);
        
        // Check if GuestTeam was created properly
        if (this.battle.GuestTeam__c == null) {
            return null;
        }
        stdController.save();
        return new PageReference('/apex/PokemonBattle?myTeam=' + myTeamStr + '&oppTeam=' + oppTeamStr);
    }
    
}