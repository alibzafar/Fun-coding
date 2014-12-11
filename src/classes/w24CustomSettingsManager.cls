/**********************************************************************
 Purpose:
 --------
 Utility for custom settings.
 
 History
 ------- 
 VERSION AUTHOR DATE USER-STORY Description
 1.0 - Ali Zafar (Salesforce)
 ***********************************************************************/
public without sharing class w24CustomSettingsManager 
{
    public static String TEST_VALUE = 'TEST_VALUE';

    public static Map<String,Config_Settings__c> getAllConfigSettings()
    {
        return Config_Settings__c.getAll();
    }
    
    public static Boolean getConfigSettingBooleanVal(String settingName)
    {
        return w24CustomSettingsManager.getConfigSetting(settingName).Checkbox_Value__c;
    }
    
    public static String getConfigSettingStringVal(String settingName)
    {
        return w24CustomSettingsManager.getConfigSetting(settingName).Text_Value__c;
    }
    
    public static String getConfigSettingDesciptionVal(String settingName)
    {
        return w24CustomSettingsManager.getConfigSetting(settingName).Description__c;
    }
    
    public static Decimal getConfigSettingNumberVal(String settingName)
    {
        return w24CustomSettingsManager.getConfigSetting(settingName).Number_Value__c;
    }
    
    public static Integer getConfigSettingIntegerVal(String settingName)
    {
        return Integer.valueOf(w24CustomSettingsManager.getConfigSetting(settingName).Number_Value__c);
    }
    
    public static Config_Settings__c getConfigSetting(String settingName)
    {
        return Config_Settings__c.getAll().get(settingName);
    }
    
    public static Map<String, String> getTextValueConfigMap(String configName){
        Map<String,Config_Settings__c> configMap = getAllConfigSettings();
        Map<String, String> textValueMap = new Map<String, String>();
        for (Config_Settings__c setting: configMap.Values()){
            if (setting.Name.startsWith(configName) && String.isNotBlank(setting.Text_Value__c)){
             textValueMap.put(setting.Text_Value__c, setting.Text_Value__c);
            }
        }       
        return textValueMap;
    }     
    
}
