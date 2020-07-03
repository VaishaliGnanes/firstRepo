@RestResource(urlMapping='/newapp')
global class webserciveclass {
	
    @HttpGet
    global static string getalldata(){
       list<Account> acc = new List<Account>();
        acc=[Select id,name from Account];
        
        string jsonoutput = json.serialize(acc);
        return jsonoutput;
    }
}