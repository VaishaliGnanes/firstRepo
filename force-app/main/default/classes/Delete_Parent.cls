public class Delete_Parent {
    public static void deletingacc(List<Contract> conaccounts){
        
     Set<Id> contractacc = new Set<Id>();
     for(Contract con : conaccounts){
        contractacc.add(con.AccountId);
    }
    List<Account> acc = new List<Account>([Select Id, Name from Account where Id IN :contractacc]);
  
        Delete acc;
            
    }

}