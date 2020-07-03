trigger customeracccon on Customer__c (before insert) {
    List<AccountTeamMember> atmlist = new List<AccountTeamMember>();
    if(Trigger.isInsert){
        for(Customer__c c:Trigger.new){
          AccountTeamMember atm=new AccountTeamMember();
          //AccountShare accshare = new AccountShare();
            atm.AccountId=c.Account__c;
            atm.TeamMemberRole='Account Manager';
            atm.UserId=c.AccountManager__c;
          atmlist.add(atm);
        }
    }
    insert atmlist;
}