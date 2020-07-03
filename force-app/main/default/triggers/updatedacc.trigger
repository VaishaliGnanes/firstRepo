trigger updatedacc on Account (before update) {
    Map<id,Account> oldmap = new Map<id,Account>();
    Map<id,Account> newmap = new Map<id,Account> ();

        Account oldacc;
        Account newacc;
        
        for(Id acc: oldmap.keySet()){
            oldacc=oldmap.get(acc);
            newacc=newmap.get(acc);
            if(oldacc.Phone!=newacc.Phone){
                System.debug('Changed');
            }
            else{
                System.debug('Not Changed');
            }
        }
    }