@isTest(seeAllData=false)
public class pricetest {

@TestSetup
    public static void CreateBook(){
        Book__c b1 = new Book__c();
        
        b1.Name = 'first';
        b1.Price__c= 10;
        insert b1;
        UserInsert();
    }
    
    public static void UserInsert(){
        User u1 = new User();
            u1.LastName = 'TestName';
            u1.Alias = 'TN';
            u1.Email = 'goutham.m2@cognizant.com';
            u1.Username = 'goutham.m2@cognizant.com';
            u1.ProfileId = '00e6F000002Rfga';
            u1.CommunityNickname = 'TestNick';
        	u1.TimeZoneSidKey='America/New_York';
            u1.LocaleSidKey='en_US';
            u1.LanguageLocaleKey='en_US';
        	u1.EmailEncodingKey='UTF-8';
        
        insert u1;
    }
    
    static TestMethod void testing(){
        Test.startTest();
        User u = [Select Id from User where Alias='TN' limit 1];
        system.runAs(u){
        Book__c bo = [Select Name, Price__c from Book__c];
        //bo.Price__c=100;
        system.assertEquals(1, bo.Price__c);
        }
        Test.stopTest();
    }
    
}