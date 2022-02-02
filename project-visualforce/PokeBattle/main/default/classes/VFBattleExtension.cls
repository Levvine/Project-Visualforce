public with sharing class VFBattleExtension {

    private final Team__c team;
    public VFBattleExtension(ApexPages.StandardController stdController) {
        this.team = (team__c)stdController.getRecord();
    }

    public String getTeam(){
        return 'Team Name: ' + team.name;
    }

    public list<Team__c> homeTeam = [SELECT Id, Name, Pokemon_1__c, Pokemon_2__c, Pokemon_3__c, Pokemon_4__c, Pokemon_5__c, Pokemon_6__c FROM Team__c];
    public list<String> opponentTeam = new list<String>();
    opponentTeam.add();



    public integer Battle(){
        integer intrandom = Integer.valueof((Math.random() * 2 ));
        //return type must be page reference.   fix later
        return intrandom;
    }
}
