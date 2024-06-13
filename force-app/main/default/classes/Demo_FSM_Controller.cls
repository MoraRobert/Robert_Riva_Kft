public with sharing class Demo_FSM_Controller {
    
    @AuraEnabled(cacheable=true)
    public static List<WorkOrder> getSObjectRecords(Id accountId){

        try {
            return [SELECT Id, Subject, Status, Priority, Description, CreatedDate
                    FROM WorkOrder
                    WHERE AccountId = :accountId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}