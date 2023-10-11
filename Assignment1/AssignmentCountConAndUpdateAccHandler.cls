public class AssignmentCountConAndUpdateAccHandler {

    public static void countConAndUpdateAcc(List<Contact> lstNewCon, List<Contact> lstOldCon){
        Set<Id> setAccIds = new Set<Id>();
       
        if(lstNewCon != Null){
            for(Contact objCon : lstNewCon){
                if(objCon.AccountId != Null){
                    setAccIds.add(objCon.AccountId);
                }
            }
        }
        
        if(lstOldCon != Null){
            for(Contact objCon : lstOldCon){
                if(objCon.AccountId != Null){
                    setAccIds.add(objCon.AccountId);
                }
            }
        }
        
        List<Account> lstAcc = [Select Id,Number_of_Contact__c, (select id from Contacts) from Account Where Id IN : setAccIds];
        
        if(lstAcc != Null){
            for(Account objAcc : lstAcc){
                objAcc.Number_of_Contact__c = objAcc.Contacts.size();
            }
        }
        
        if(!lstAcc.isEmpty()){
            update lstAcc;
        }
    }
}