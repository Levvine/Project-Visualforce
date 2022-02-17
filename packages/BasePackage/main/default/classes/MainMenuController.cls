public class MainMenuController {

    public MainMenuController() {}
    
    public PageReference play() {
        Contact trainer = Auth.trainer;
        Battle__c battle = new Battle__c(Name=(trainer.Name + ' vs '));
        insert battle;
        Participant__c participant = new Participant__c(Name=trainer.Name + ' | ', Trainer__c=trainer.Id, Battle__c=battle.Id);
        insert participant;
        battle.Host__c = participant.Id;
        upsert battle;
        return new PageReference('/apex/PreBattle?battleId=' + battle.Id + '&id=' + participant.Id);
    }
    
    public PageReference teams() {
        return new PageReference('/apex/Teams');
    }
    
    public PageReference dex() {
        return new PageReference('/apex/Pokedex');
    }
    
}