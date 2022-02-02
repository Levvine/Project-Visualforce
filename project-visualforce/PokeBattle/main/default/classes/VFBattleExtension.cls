public with sharing class VFBattleExtension {

    private final Team__c team;

    public VFBattleExtension(ApexPages.StandardController stdController) {
        this.team = (team__c)stdController.getRecord();
    }

    public String getTeam(){
        return 'Hello ' + team.name + ' (' + team.id + ')';
    }
}
