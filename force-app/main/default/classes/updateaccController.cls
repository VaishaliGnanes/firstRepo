public class updateaccController {

    public string vname{get;set;}
    public string phonenum{get;set;}
    
    public string getproc()
    {
        phonenum=String.valueOf([select Phone from Account where Name=:vname]);
        return phonenum;
    }
  
 
}