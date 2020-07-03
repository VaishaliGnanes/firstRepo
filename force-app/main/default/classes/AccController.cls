public class AccController {

    public String getTest2() {
        return null;
    }


    public String Test { get; set; }

    public List<cAccount> AccList {get;set;}
    
    public List<cAccount> getacc()
    {
        AccList=new List<cAccount> ();
        for(Account a :[select AccountNumber,BillingAddress from Account LIMIT 10])
        {
            AccList.add(new cAccount(a));
        }
        return AccList;

    }
    
    public PageReference ProcessSelected()
    {
        List<Account> acclist1=new List<Account>();
        for(cAccount c: getacc())
        {
             if(c.selected == true) 
             {
                 acclist1.add(c.acc1);
                 
        }
        }
            System.debug('These are the selected Contacts...');
                for(Account a: acclist1) {
                        system.debug(a);
                }
                acclist1=null; 
                return null;
            
    }
    
    public class cAccount
    {
        public Account acc1{get;set;}
       public Boolean selected {get;set;}
        public cAccount(Account a)
        {
            acc1=a;
            selected=false;
        }
    }
}