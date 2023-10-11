public with sharing class AccountController {
    
    @AuraEnabled(Cacheable=true)
    public static List<Account> fetchAccount(){
        List<Account> lstAcc = new List<Account>();
        try {
            lstAcc = [Select Id,Name,Phone,Industry,createdDate from Account order by createdDate DESC limit 10];
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
        System.debug('lstAcc=== '+lstAcc);
        return lstAcc;
    }
}