global class SchedulableAutoapproval implements schedulable{

    global void execute(SchedulableContext sc){
        
       Autoapproveleave al=new Autoapproveleave();
        database.executeBatch(al,200);
    }
}