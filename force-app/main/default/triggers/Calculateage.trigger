trigger Calculateage on Contact (before insert) {
    list<contact> con=new list<contact>();
    for(Contact c:Trigger.new){
        c.id=c.id;
        c.Age__c=system.today().year()-c.Birthdate.year();
       // con.add(c);
       
    }
    //update con;
}