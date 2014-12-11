/**********************************************************************
 Purpose: Standard handler for all triggers.
 --------
 
 
 History
 ------- 
 VERSION AUTHOR DATE USERSTORY Description
 1.0 - Ali Zafar - Intial Development 
 *************************************************************************/
 
public class W24TriggerHandler
{
    
    public static void mainEntry(Schema.SObjectType triggerObject, Boolean IsBefore, Boolean IsAfter, 
        Boolean IsInsert,
        Boolean IsUpdate,
        Boolean IsDelete,
        Boolean IsUnDelete,
        Boolean IsExecuting,
        List<SObject> newList, Map<Id, SObject> newMap, List<SObject> oldList, Map<Id, SObject> oldMap)
    {

        if (Trigger.new != null)
        {
            System.debug('Trigger size: ' + System.Trigger.new.size());
        }

        if (triggersAreEnabled())
        { 
            if (triggerObject == Contact.getSObjectType())
            {
                W24ContactTriggerHandler.mainEntry(IsBefore,IsAfter, 
                IsInsert,
                IsUpdate,
                IsDelete,
                IsUnDelete,
                IsExecuting,
                (List<Contact>)newList, (Map<Id,Contact>)newMap, (List<Contact>)oldList, (Map<Id,Contact>)oldMap);
            }
            else if (triggerObject == Case.getSObjectType())
            {
                W24CaseTriggerHandler.mainEntry(IsBefore,IsAfter, 
                IsInsert,
                IsUpdate,
                IsDelete,
                IsUnDelete,
                IsExecuting,
                (List<Case>)newList, (Map<Id,Case>)newMap, (List<Case>)oldList, (Map<Id,Case>)oldMap);
            }
        }
    }
    
    public static boolean triggersAreEnabled()
    {
        //Enable the trigger for test classes
        if(Test.isrunningTest())
        {
            return true; 
        }
        else
        {
            //Checking user profile to determine if triggers should be run :'+W24_Global_Settings__c.getInstance().Fire_Triggers__c);
            return Global_Settings__c.getInstance().Fire_Triggers__c;
        }
    }

}
