public class BattleExtension {

   	final Battle__c battle;
    String country = null;
    String testValue = 'Test Value';
    
    public BattleExtension(ApexPages.StandardController stdController) {
        this.battle = (Battle__c) stdController.getRecord();
        this.battle.Host__c = '0031700001KRXCMAA5'; // hardcoding id works
    }
    
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('US','US')); 
        options.add(new SelectOption('CANADA','Canada')); 
        options.add(new SelectOption('MEXICO','Mexico')); return options; 
    }
    
    public String getCountry() {
        return country;
    }
                    
    public void setCountry(String country) { this.country = country; }
    
    public String getTestValue() {
        return testValue;
    }
    
}