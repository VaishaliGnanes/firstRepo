@isTest
        public class GrowerRelationshiptriggerHandler_Test {
        
            @TestSetup
            public static void CreateData(){
                List<Account> acc=DataUtilityClass.createacc(10);
                insert acc;
                
                List<Growerrealtionship__c> grrec=DataUtilityClass.createGRrecords(acc);
                Database.insert(grrec);
                
               List<Payment__c> pyrec=DataUtilityClass.createPYrecords(acc);
                Database.insert(pyrec);
            
            }
            
            public static testmethod void GRtriggertest(){
                test.startTest();
                User u=[Select id from User limit 1];
                system.runAs(u){
                    List<Growerrealtionship__c> g=[Select Name,Status__c from Growerrealtionship__c];
                    for(Growerrealtionship__c grrecp : g){
                        grrecp.Status__c=false;
                    }
                    try { 
                        update g;
                    }
                    catch(Exception e)
                    {
                        Boolean var = e.getMessage().contains('We have a payment')?true:false;
                        System.assertEquals(true,var);
                    }
                    
                }
                test.stopTest();
            }
            
            public static testmethod void deleteGRrecords(){
                 test.startTest();
                User u=[Select id from User limit 1];
                system.runAs(u){
                    List<Growerrealtionship__c> g=[Select Name,Status__c from Growerrealtionship__c];
                    for(Growerrealtionship__c grrecp : g){
                        grrecp.Status__c=false;
                    }
                    try { 
                        delete g;
                    }
                    catch(Exception e)
                    {
                        Boolean var = e.getMessage().contains('We have a payment')?true:false;
                        System.assertEquals(true,var);
                    }
                    
                }
                test.stopTest();
                
            }
            
           
        }