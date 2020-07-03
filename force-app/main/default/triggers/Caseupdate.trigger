trigger Caseupdate on Case (before insert) {

    List<AccountTeamMember> atm=new List<AccountTeamMember>();
    Map<ID,String> userid = new  Map<ID,String>();
    Set<id> accid= new Set<id>();
      for(Case c:Trigger.new){
        accid.add(c.AccountID);
    }
    atm=[Select id,AccountId,UserId from AccountTeamMember where AccountId IN:accid and TeamMemberrole='DSM'];
    system.debug('ATM'+atm);
    
    for(AccountTeamMember acc:atm){
        userid.put(acc.AccountId, acc.UserId);
    }
    for(Case c:trigger.new){
        c.OwnerId=userid.get(c.AccountId);
    }
}