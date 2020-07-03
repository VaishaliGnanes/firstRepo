trigger contrigger2 on Contact (before update) {
for(Contact con:Trigger.New){
If(con.Description !=''){
con.Description='This is'+userInfo.getUserName();
}
}}