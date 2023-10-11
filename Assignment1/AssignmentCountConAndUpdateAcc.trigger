trigger AssignmentCountConAndUpdateAcc on Contact (after insert, after update, after delete, after undelete) {

    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete)){
        AssignmentCountConAndUpdateAccHandler.countConAndUpdateAcc(Trigger.New, Trigger.Old);
    }
}
