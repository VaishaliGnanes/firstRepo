public with sharing class HTMLTable {
    
    public list<contact> lstcon {get;set;}
    public HTMLTable(ApexPages.StandardController controller) {
        lstcon =[SELECT Id,FIRSTNAME,LASTNAME,EMAIL,Account.Name,Phone FROM Contact];
    }

}