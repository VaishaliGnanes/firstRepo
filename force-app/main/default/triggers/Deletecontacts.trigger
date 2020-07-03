trigger Deletecontacts on Account (before delete) {
    List<ID> acc=new List<ID>();
    for(Account a:trigger.old){
        acc.add(a.id);
    }
    if(!acc.isEmpty()){
        List<contact> con=[Select id from Contact where accountid in:acc];
        delete con;
    }
    
}