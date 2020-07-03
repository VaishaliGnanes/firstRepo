trigger contrigger on Contact (before insert) {
for(Contact con: Trigger.new){
con.Description=con.FirstName+con.LastName;
}
}