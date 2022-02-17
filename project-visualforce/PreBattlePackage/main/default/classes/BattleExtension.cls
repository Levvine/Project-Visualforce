public class BattleExtension {
    
    final ApexPages.StandardController stdController;    
    final Battle__c battle;
    
    public Boolean hasId {
        get {
            if (this.stdController.getId() == null || this.battle.Host__c == null) return false;
            return true;
        }}
    public Participant__c host { get; private set; } 
    public List<Participant__c> guests { get; private set; }
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
    public static final List<String> fieldNames = new List<String>{'Participants__r.Name'};
    
    public BattleExtension(ApexPages.StandardController stdController) {
        this.stdController = stdController;
        this.stdController.addFields(fieldNames);
        this.battle = (Battle__c) stdController.getRecord();
        
         System.debug(this.battle);
        System.debug(fieldNames);
        if (stdController.getId() != null && this.battle.Host__c != null) {
            this.host = [SELECT Name, Trainer__c, Team__c FROM Participant__c WHERE Battle__c=:this.battle.Id AND Id=:this.battle.Host__c];
            this.guests = [SELECT Name, Trainer__c, Team__c FROM Participant__c WHERE Battle__c=:this.battle.Id AND Id!=:this.battle.Host__c];
            this.opponent = RANDOM;
            this.opponentHelpText = 'Select an opposing team source.';
            this.opponentURL = '';
        }
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
        if (this.host == null) {
            return null;
        }
        // If selected guest type is CPU, generate a new CPU participant.
        if (this.battle.Guest_Type__c == 'CPU') {
            SObject oppTeam;
            if (opponent == RANDOM) {
                oppTeam = new Team__c(
                    Name = 'CPU Team',
                    Pokemon_1__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_2__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_3__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_4__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_5__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_6__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1)
                );
                insert oppTeam;
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
                    
                    oppTeam = SiteUtils.createSObject('Team__c', resMap);
                    insert oppTeam;
                } catch (CalloutException e) {
                    System.debug(e);
                }
            }
            Contact trainer = CPUController.trainer;
            Participant__c guest = new Participant__c(Trainer__c=trainer.Id, Team__c=oppTeam.Id, Battle__c=this.battle.Id);
            insert guest;
            guests.add(guest);
        }
        String myTeamStr = String.valueOf(this.host.Id);
        String oppTeamStr = String.valueOf(this.guests[0].Id);
        
        // Check if GuestTeam was created properly
        if (this.guests[0] == null) {
            return null;
        }
        stdController.save();
        return new PageReference('/apex/PokemonBattle?myTeam=' + myTeamStr + '&oppTeam=' + oppTeamStr);
    }
    
}