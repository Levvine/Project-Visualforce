public class SiteUtils {
    
    public static SObject createSObject(String sObjName, Map<String, Object> untypedValues) {
        // Create new sObject
        SObject sObj = (SObject) Type.forName(sObjName).newInstance();
        sObj = editSObject(sObj, untypedValues);
        return sObj;
    }
    
    // gets an sObject with Id, Name, and all custom fields
    public static SObject getSObject(String sObjName, String recordId) {
        List<SObject> sObjs = getSObjects(sObjName, new List<String>{recordId} , 1);
        if (sObjs.size() == 0) {
            return null;
        }
        
        return sObjs[0];
    }
    
    // gets a list of sObjects with Id, Name, and all custom fields
    public static List<SObject> getSObjects(String sObjName) {
        List<SObject> sObjs = getSObjects(sObjName, null, null);
        
        return sObjs;
    }
    
    // contains optional param recordIds which is a list of Ids filter queries
    // contains optional param limits the number of records queried
    public static List<SObject> getSObjects(String sObjName, List<String> recordIds, Integer lim) {
        // Get sObject type and all its fields
        SObjectType sObjType = ((SObject) Type.forName(sObjName).newInstance()).getSObjectType();
        List<Schema.SObjectField> sObjFields = sObjType.getDescribe().fields.getMap().values();

        // Filter fields to only include Name, Id and custom fields
        List<String> fields = new List<String>();
        for (Schema.sObjectField sObjField : sObjFields) {
            String field = String.valueOf(sObjField);
            if (sObjField.getDescribe().isCustom() || field == 'Name' || field == 'Id') {
                fields.add(field);
            }
        }
        
        // Create dynamic SOQL query
        String fieldsStr = String.join(fields, ', ');
        List<String> params = new List<String>{fieldsStr, String.valueOf(sObjType)};
       	String query = String.escapeSingleQuotes(String.format('SELECT {0} FROM {1}', params));
        if (recordIds != null) {
            query += (' WHERE Id IN :recordIds');
        }
        if (lim != null) {
            query += (' LIMIT ' + lim);
        }
        List<SObject> sObjs = Database.query(query);
        
        
        return sObjs;
    }
    
    
    
    public static SObject editSObject(SObject sObj, Map<String, Object> untypedValues) {
        SObjectType sObjType = sObj.getSObjectType();
        
        // Retrieve a Map of all fields in the specified sObject
        Map<String, Schema.SObjectField> sObjFieldsMap = sObjType.getDescribe().fields.getMap();
        
        // Iterate through the sObject fields and cast values to System.Type based on their DisplayType
        for (String field : sObjFieldsMap.keySet()) {
            // field that the casted value will be written to
            SObjectField sObjField = sObjFieldsMap.get(field);
            // DisplayType of the selected field
            Schema.DisplayType dispType = sObjField.getDescribe().getType();
            // untyped value that will be written to the selected field
            Object untypedValue = untypedValues.get(String.valueOf(sObjField));
            if (untypedValue != null) {
                switch on (String.valueOf(dispType)) {
                    when 'DOUBLE' {
                        sObj.put(sObjField, Double.valueOf(untypedValue));
                    }
                    when 'STRING', 'TEXTAREA', 'URL', 'ADDRESS', 'ID', 'EMAIL' {
                        sObj.put(sObjField, String.valueOf(untypedValue));
                    }
                    when 'INTEGER' {
                        sObj.put(sObjField, Integer.valueOf(untypedValue));
                    }
                    when else {
                        sObj.put(sObjField, untypedValue);
                    }
                }
            }
        }
        return sObj;
    }
    
    public static SObject deleteSObject(String sObjType, String recordId) {
        SObject sObj = getSObject(sObjType, recordId);
        delete sObj;
        return sObj;
    }
    
}