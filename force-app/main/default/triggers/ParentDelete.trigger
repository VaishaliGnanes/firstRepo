trigger ParentDelete on Contract (after Delete) {
    if(Trigger.isDelete){
  Delete_Parent.deletingacc(Trigger.Old);
    
    }

}