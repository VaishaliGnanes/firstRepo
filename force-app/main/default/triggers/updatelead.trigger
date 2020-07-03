trigger updatelead on Lead (before insert,before update) {

    for(lead l:trigger.new){
        l.FirstName='Dr'+l.FirstName;
    }
}