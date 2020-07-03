@RestResource(urlMapping='/CasePicklistvalues/*')

Global class CasePicklistController{
        
    @HttpGet
    Global static Map<String, List<picklistwrapper>> CasePicklistService() {
        
        //recordtypes 
        Map<String, Schema.RecordTypeInfo> RTMap = Case.SObjectType.getDescribe().getRecordTypeInfosByName();   
        System.debug('recordtypes'+ RTMap);

        Schema.RecordTypeInfo rtByName =  RTMap.get('Product Claims');
        Id recordTypeId = rtByName.getRecordTypeId();
        system.debug('recordtypeid'+ recordTypeId);
        
        //Field map
        Schema.DescribeSObjectResult objSchema = Case.sObjectType.getDescribe();
        System.debug('values='+objSchema);
             
        Map<String, Schema.SObjectField> fieldMap = objSchema.fields.getmap();
        system.debug ('Fields'+ fieldMap);
        
        List<String> fieldnames = new List<String>();
       /* for(Schema.SObjectField fieldtoken : fieldMap.values())
        {
            String fieldname = fieldtoken.getDescribe().getname();
            fieldnames.add(fieldname);
        } */
        
        //picklist map returns key of picklist fieldname and value of picklist values
        Map<String, List<picklistwrapper>> picklistmap = new Map<String, List<picklistwrapper>>();            
        
        String endpoint = URL.getSalesforceBaseUrl().toExternalForm();
        endpoint += '/services/data/v43.0';
        endpoint += '/ui-api/object-info/Case/picklist-values/{0}';       
        endpoint = String.format(endpoint, new String[]{ recordTypeId});
        endpoint = endpoint.replace('/Id','');
        endpoint = endpoint.replace('/IsDeleted','');
        EncodingUtil.urlEncode(endpoint,'UTF-8');
        system.debug(endpoint +'Line 83');
        
        //HTTP Request send
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId()); 
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
        //Parse response
        system.debug(res+'line 93');
        system.debug(res.getBody()+'Line 94');
        Map<String,String> result = new Map<String,String>();
        Map<String,Object> root = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
        system.debug(root+'line 95');
        system.debug(root.keyset()+'Line 97');
        system.debug(root.values()+'Line 98');       
               
        Map<String,Object> pValueMap= (Map<String,Object>) root.get('picklistFieldValues');
        
        for(String fieldName : pvalueMap.keySet()){            
                Map<String, Object> picValMap = (Map<String,Object>) pValueMap.get(fieldName); //obj;
                system.debug(picValMap.keySet()+'Line 103'+picValMap.values());
               Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
            System.debug('Field API Name'+fielddataType);
                if(fielddataType == Schema.DisplayType.Picklist){
                List<Schema.Picklistentry> fld =fieldMap.get(fieldname).getDescribe().getpicklistValues();
                System.debug('fieldmap picklist values'+json.serialize(fld));
                }
            
            
            List<Object> pValues = (List<Object>)picValMap.get('values');
            for(Object pValue : pValues){
                Map<String,Object> pValueMap1 = (Map<String,Object>)pValue;
                system.debug(pValueMap1 + 'Line 119');
                result.put((String)pValueMap1.get('value'), (String)pValueMap1.get('label'));
                System.debug('resultmap'+result);
                    String label = (String)pValueMap1.get('label');
                    String Value = (String)pValueMap1.get('value');
                              string picklistID = '';
                              string parentID = '';
                    if(!picklistmap.containsKey(fieldName)){
                        picklistmap.put(fieldName, new List<picklistwrapper>());
                    }
                    picklistmap.get(fieldName).add(new picklistwrapper(label, value,picklistID,parentID));            
            }                 
               
        }
               
        System.debug('@output -->'+picklistmap);
        return picklistmap;
    }
    
    // Wrapper Class
    public class picklistwrapper
    {
        String label {get; set;}
        String value {get; set;}
        string picklistID {get;set;}
        string parentID{get;set;}
        picklistwrapper(String label1, String value1,string picklistID,string parentID)
        {
            label = label1;
            value = value1;
            picklistID = picklistID;
            parentID = parentID;
        }
    }
      
}