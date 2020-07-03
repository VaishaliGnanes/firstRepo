trigger PriceDiscount on Book__c (before insert, before update) {	
		    calc.calc(Trigger.new);  
}