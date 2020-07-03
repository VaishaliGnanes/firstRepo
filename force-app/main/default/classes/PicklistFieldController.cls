@RestResource(urlMapping='/PicklistControl/')
global class PicklistFieldController {    
    @HttpGet
    global static Map<String,List<String>> getDependentOptionsImpl(){
        String objName ='Case';
        Schema.DescribeFieldResult dependent = Case.Product__c.getDescribe();
        Schema.sObjectField controlling= dependent .getController();
        String dependentField = String.valueof(dependent.getName());
        String controllingField =String.valueof(controlling);
        String objectName = objName.toLowerCase();
        system.debug('dependentField - '+dependentField);
        system.debug('controllingField - '+controllingField);
        system.debug('objectName'+objectName);
        Map<String,List<String>> objResults = new Map<String,List<String>>();
        //get the string to sobject global map
        Map<String,Schema.SObjectType> objGlobalMap = Schema.getGlobalDescribe();
        if (!Schema.getGlobalDescribe().containsKey(objectName)){
            System.debug('OBJNAME NOT FOUND --.> ' + objectName);
            return null;
        }
        
        Schema.SObjectType objType = Schema.getGlobalDescribe().get(objectName);
        system.debug('objType - '+objType);
        if (objType==null){
            return objResults;
        }
        Bitset bitSetObj = new Bitset();
        Map<String, Schema.SObjectField> objFieldMap = objType.getDescribe().fields.getMap();
        system.debug('objFieldMap - '+objFieldMap.get('Product__c'));
        //Check if picklist values exist
        if (!objFieldMap.containsKey(controllingField) || !objFieldMap.containsKey(dependentField)){
            System.debug('Controlling Field - '+(objFieldMap.containsKey(controllingField)));
            System.debug('Dependent Field -' +(objFieldMap.containsKey(dependentField)));
            System.debug('FIELD NOT FOUND --.> ' + controllingField + ' OR ' + dependentField);
            return objResults;     
        }
        List<Schema.PicklistEntry> contrEntries = objFieldMap.get(controllingField).getDescribe().getPicklistValues();
        system.debug('entry');
        system.debug('contrEntries -'+ contrEntries);
        List<Schema.PicklistEntry> depEntries = objFieldMap.get(dependentField).getDescribe().getPicklistValues();
        system.debug('depEntries -'+ depEntries);
        objFieldMap = null;
        List<Integer> controllingIndexes = new List<Integer>();
        for(Integer contrIndex=0; contrIndex<contrEntries.size(); contrIndex++){            
            Schema.PicklistEntry ctrlentry = contrEntries[contrIndex];
            String label = ctrlentry.getLabel();
            objResults.put(label,new List<String>());
            controllingIndexes.add(contrIndex);
        }
        List<Schema.PicklistEntry> objEntries = new List<Schema.PicklistEntry>();
        List<PicklistEntryWrapper> objJsonEntries = new List<PicklistEntryWrapper>();
        for(Integer dependentIndex=0; dependentIndex<depEntries.size(); dependentIndex++){            
               Schema.PicklistEntry depentry = depEntries[dependentIndex];
               objEntries.add(depentry);
        } 
        objJsonEntries = (List<PicklistEntryWrapper>)JSON.deserialize(JSON.serialize(objEntries), List<PicklistEntryWrapper>.class);
        List<Integer> indexes;
        for (PicklistEntryWrapper objJson : objJsonEntries){
            if (objJson.validFor==null || objJson.validFor==''){
                continue;
            }
            indexes = bitSetObj.testBits(objJson.validFor,controllingIndexes);
            for (Integer idx : indexes){                
                String contrLabel = contrEntries[idx].getLabel();
                objResults.get(contrLabel).add(objJson.label);
            }
        }
        objEntries = null;
        objJsonEntries = null;
        return objResults;
    }



public class PicklistEntryWrapper{
    
    public PicklistEntryWrapper(){            
    }
    public String active {get;set;}
    public String defaultValue {get;set;}
    public String label {get;set;}
    public String value {get;set;}
    public String validFor {get;set;}
}

}