trigger CUpdate on Case (before insert) {
    
    Set<Id> accid = new Set<Id>();
    for(Case c1 : Trigger.New){
        accid.add(c1.AccountId);        
    }
    Map<Id,String> mp = new Map<Id,String>();
    List<AccountTeamMember> latm = new List<AccountTeamMember>([Select AccountId, UserId from AccountTeamMember where AccountId IN: accid and TeamMemberRole = 'DSM']);
    for(AccountTeamMember atm : latm){
            mp.put(atm.AccountId, atm.UserId);
       }
    
    for(Case cs : Trigger.New){
        cs.OwnerId = mp.get(cs.AccountId);
        
    }

}