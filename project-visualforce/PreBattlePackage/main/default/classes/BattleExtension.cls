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
        return stdController.save();
    }

}