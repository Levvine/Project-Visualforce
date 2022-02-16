public class PreBattleController {
    final Battle__c battle;
    final Participant__c host;
    final List<Participant__c> guests;
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
    
    public PreBattleController() {
        Map<String, String> params = ApexPages.currentPage().getParameters();
        String battleId = params.get('Id');
        System.debug(battleId);
       	
        /*
        // if no battleId, create new battle. otherwise, retrieve current battleId. 
        if (battleId != null) {
        	this.battle = SiteUtils.getSObject('Battle__c', battleId);
        } else {
            // battle name will be Trainer vs Trainer and assigned later.
            this.battle = new Battle();
        }
        // attempt to find a host. if no host is found, assign current user as host.
        try {
            this.host = [SELECT Name, Trainer__c, Team__c FROM Participant__c WHERE Battle__c=:this.battle.Id AND Id=:this.battle.Host__c];
        } catch (QueryException e) {
            String trainerId = '0031700001KRXCMAA5'; // hardcoding id works
            Participant__c host = new Participant__c(Trainer__c=trainerId, Battle__c=this.battle.Id);
            insert host;
            this.host = host;
        }
        this.guests = [SELECT Name, Trainer__c, Team__c FROM Participant__c WHERE Battle__c=:this.battle.Id AND Id!=:this.battle.Host__c];
        this.opponent = RANDOM;
        this.opponentHelpText = 'Select an opposing team source.';
        this.opponentURL = '';
*/
    }
}