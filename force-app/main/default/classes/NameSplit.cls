public class NameSplit {
    public NameSplit(){
        List<AOR__c> rec = new List<AOR__c>();
        rec = [Select Name from AOR__c];
        for(AOR__c a1 : rec){
            String name =  a1.Name;
            String splitname = name.substringAfterLast('-');
            System.debug('@@2'+ splitname);
        }
    }

}