public with sharing class DemoInvocable {
    
    @InvocableMethod(Label='Demo Invocable Method')
    public static void demoInvocableMethod(List<FlowInput> flowInputs){

        if(!flowInputs.isEmpty()){ //69
                FlowInput input = flowInputs[0];
                String integrationPoint = input.integrationPoint;
                if(integrationPoint == 'Salesforce'){
                    Integration_Log__c log = new Integration_Log__c();                    
                    log.Integration_Point__c = 'Salesforce';
                    log.Related_Account_Id__c = input.triggeringRecordId;
                    if(Integration_Log__c.SObjectType.getDescribe().isAccessible()){
                        insert log;
                    }
                        
                } else {                    
                    system.debug('exception: the integration point in invalid');
                }
            }
    }
    
    public with sharing class FlowInput {
        @InvocableVariable(Label='triggeringRecordId')
        //public List<Id> triggeringRecordIds;
        public String triggeringRecordId;

        @InvocableVariable(Label='integrationPoint')
        public String integrationPoint;

        @InvocableVariable(Label='integrationLogId')
        public Id logId;        
    }

}
