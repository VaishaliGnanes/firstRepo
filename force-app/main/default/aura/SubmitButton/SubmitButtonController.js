({
    submit:function(component,event,helper){
    	alert('hi');
    	var action = component.get("c.UpdateCase");
    	action.setParams({
    		caseId:component.get("v.recordId")
    	});       
        action.setCallback(this,function(response){
            var state=response.getState();
            alert(state);
        	var res=response.getReturnValue();
        	alert(res);
        });
	}
})