global class schedclass implements Schedulable{

global void execute(SchedulableContext sc){

Database.ExecuteBatch(new UpdateContactAddresses());
}

}