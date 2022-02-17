public class PreBattleExtension {
	final ApexPages.StandardController stdController;
	final Map<String, String> params;    
    final List<Participant__c> participants;
    
    public Boolean hasId {
        get {
            if (this.params.get('battleId') == null || this.battle.Host__c == null) return false;
            return true;
        }}
    public Battle__c battle { get; set; }
    // equalivalent to stdController.getRecord();
    public Participant__c participant {
        get {
            return this.participants[0];
        }}
    public Participant__c host {
        get {
            if (this.host == null) {
                // search for host
                for (Participant__c participant : this.participants) {
                    if (participant.Id == this.battle.Host__c) {
                        this.host = participant;
                    }
                }
            }
            return this.host;
        }
        private set;
    } 
    public List<Participant__c> guests {
        get {
            if (this.guests == null) {
                this.guests = new List<Participant__c>();
                // add non-host participants
                for (Participant__c participant : this.participants) {
                    if (participant.Id != this.battle.Host__c) {
                        this.guests.add(participant);
                    }
                }
            }
            return this.guests;
        }
        private set;
    }
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
    public static final List<String> fieldNames = new List<String>{'Trainer__c'};
    
    public PreBattleExtension(ApexPages.StandardController stdController) {
        this.stdController = stdController;
        // this.stdController.addFields(fieldNames);
        this.participants = new List<Participant__c>{ (Participant__c) stdController.getRecord() };
        this.params = ApexPages.currentPage().getParameters();
		
        // if battleId is present, add battle to participant
        String battleId = this.params.get('battleId');
        if (battleId != null) {
            this.battle = (Battle__c) SiteUtils.getSObject('Battle__c', battleId);
            
            // add all child participants of the current battle, except for current trainer's participant record.
            List<Participant__c> participants = [SELECT Name, Trainer__c, Team__c FROM Participant__c WHERE Battle__c=:this.battle.Id AND Id!=:this.participants[0].Id];
            this.participants.addAll(participants);
                        
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
        return null;
    }
    
    public PageReference save() {
        // Check if HostTeam was selected properly
        if (this.participant.Team__c == null) {
            this.participant.Team__c.addError('Please select a valid team.');
            return null;
        }
        // If selected guest type is CPU, generate a new CPU participant.
        // Remember to add trainer to team or filter will reject record.
        if (this.battle.Guest_Type__c == 'CPU') {
            Team__c oppTeam;
            if (opponent == RANDOM) {
                oppTeam = (Team__c) new Team__c(
                    Name = 'CPU Team',
                    Pokemon_1__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_2__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_3__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_4__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_5__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Pokemon_6__c = Integer.valueof(Math.random() * (Pokemon.maxNum - 1) + 1),
                    Trainer__c = CpuController.trainer.Id
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
                    
                    oppTeam = (Team__c) SiteUtils.createSObject('Team__c', resMap);
                    oppTeam.Trainer__c = CPUController.trainer.Id;
                    insert oppTeam;
                } catch (CalloutException e) {
                    this.participant.addError('There was an issue retrieving from the specified address.');
                    System.debug(e);
                    return null;
                }
            }
            Contact trainer = CPUController.trainer;
            System.debug(trainer);
            Participant__c guest = new Participant__c(Trainer__c=CPUController.trainer.Id, Team__c=oppTeam.Id, Battle__c=this.battle.Id);
            insert guest;
            guests.add(guest);
        }
        String myTeamStr = String.valueOf(this.host.Team__c);
        String oppTeamStr = String.valueOf(this.guests[0].Team__c);
        
        // Check if GuestTeam was created properly
        if (this.guests[0] == null) {
            return null;
        }
        stdController.save();
        // upsert battle at end
        upsert this.battle;
        return new PageReference('/apex/Battle?myTeam=' + myTeamStr + '&oppTeam=' + oppTeamStr);
    }
}