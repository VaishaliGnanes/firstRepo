public class StatusProgressBarController {

    public String selectedObject;
    public String selectedField;
    
    public string currentStatus{get;set;}
    public list<String> picklistOptions{get;set;}
    
    
    public StatusProgressBarController(){
        picklistOptions=new List<String>();
    }
    public void setselectedObject(string obj){
        system.debug('*******setter method get called-setselectedObject');
        selectedObject=obj.toUpperCase();
        
    }
    public string getselectedObject(){
        system.debug('*******getter method get called-getselectedObject');
        return selectedObject;
    }
    
    public void  setselectedField(string fld){
        system.debug('*******setter method get called-setselectedField');
        selectedField=fld.toUpperCase();
        
    }
    public string getselectedField(){
        system.debug('*******getter method get called-getselectedField');
        return selectedField;
    }
    
    //public PageReference GenerateProgressBar(string objname,String FieldName){
    public PageReference GenerateProgressBar(){
        system.debug('*******GenerateProgressBar*****objname:'+selectedObject);
        system.debug('******GenerateProgressBar******FieldName:'+selectedField);
        Schema.DescribeSObjectResult objDescribe=Schema.getGlobalDescribe().get(selectedObject).getdescribe();
        Map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap(); 
        Schema.DescribeFieldResult fd=fieldMap.get(selectedField).getDescribe();
        if(String.valueof(fd.getType()).equalsignorecase('Picklist')){
            List<Schema.PicklistEntry> Pp = fd.getPicklistValues();
            for(Schema.PicklistEntry p:Pp){
                system.debug('****picklist option label'+P.getLabel());
                system.debug('****picklist option value'+P.getvalue());
                picklistOptions.add(P.getLabel());
            }
        }
        
        string recordid= ApexPages.currentPage().getParameters().get('id');
        if(recordid!=null && recordid!=''){
            string queryString ='select id,'+selectedField + ' from '+ selectedObject + ' where id= \''+recordid+ '\'';
            system.debug('************queryString :'+queryString );
            
            sobject sobj=database.query(queryString);
            currentStatus=(string)sobj.get(selectedField);
        }else{
            currentStatus='';
            system.debug('*********not able to find current status of records');
        }
        return null;
    }
}