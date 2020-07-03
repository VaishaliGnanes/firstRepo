public class AcctContr {

    public List<Lead> clist{get;set;}
    public List<Lead> getcon()
    {
        clist=new List<Lead>();
        for(Lead c:[Select name from Lead LIMIT 10])
        {
            clist.add(c);
        }
        return clist;
    }
    
 
    
}