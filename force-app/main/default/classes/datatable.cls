public class datatable{

    public String username { get; set; }

    public String inputValue { get; set; }

    public datatable() {

    }


Public string RequestId{get;set;}
Public string Accid{get;set;}
Public List<Account> ListAcc{get;set;}
    public datatable(ApexPages.StandardSetController controller) {
        
        Accid=ApexPages.currentPage().getParameters().get('id');
    }

List<Account> acc;

public List<Account> getAccounts(){

ListAcc = [SELECT Id,NAME from aCCOUNT WHERE Id=:inputValue ];
return ListAcc;
}
}