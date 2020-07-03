public class Calc {
    public static void calc(List<Book__c> bk){
        List<Book__c> books=new List<Book__c>();
        List<Book__c> books1=new List<Book__c>();
        //Set<ID> bookid= new Set<ID>();
        integer count = 0;
     /**   for(Book__c bks:bk){   
           bookid.add(bks.ID);
            Book__c book = new book__c(Id=bks.id);
            book.Price__c=0.1*bks.Price__c;
            books.add(book);
            system.debug('execution count ::'+count);
            count++;
}**/
        
      // books=[Select ID,Price__c from Book__c where ID IN :bookid];
          for(Book__c bks:bk){
               bks.Price__c=0.1*bks.Price__c;
            books1.add(bks);
              }
              
      //  upsert books;
    }
}