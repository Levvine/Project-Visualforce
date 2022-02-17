@RestResource(urlMapping='/Pokemon/*')
global class PokemonController {
    
    static RestRequest req = RestContext.request;
    static RestResponse res = RestContext.response;
    static String sObjName = 'Pokemon';
    
    @HttpGet
    global static void getTeam() {
        // Parse request parameters
        // Sanitizes Id input
        String teamId = String.escapeSingleQuotes(req.requestURI.substringAfter(sObjName + '/'));
        
        Object body;
        // SOQL Query
        try {
            Integer someInt;
            if (teamId == '') {
                someInt = 1;
            } else {
                someInt = Integer.valueOf(teamId);
            }
            // Send response
            res.statusCode = 200;
            res.addHeader('Content-Type', 'application/json');
            res.responseBody = Blob.valueof(JSON.serialize(Pokemon.get(someInt)));
        } catch (System.QueryException e) {
            System.debug(e);
            res.statusCode = 404;
        }
    }
    
    @HttpPut
    global static void editTeam() {
        // Parse request parameters
        // Sanitizes Id input
        String teamId = String.escapeSingleQuotes(req.requestURI.substringAfter(sObjName + '/'));
        Object reqBody = JSON.deserializeUntyped(req.requestBody.toString());
        
        // determine if body is in the correct format
        try {
            Map<String, Object> reqMap = (Map<String, Object>) reqBody;
            
            Object resBody;
            SObject team;
            // Database upsert
            if (teamId == '') {
                team = SiteUtils.createSObject(sObjName, reqMap);
            } else { 
                team = [SELECT Id FROM Team__c WHERE Id = :teamId];
                team = SiteUtils.editSObject(team, reqMap);
            }
            upsert team;
            resBody = team;
            
            
            // Send response
            res.statusCode = 200;
            res.addHeader('Content-Type', 'application/json');
            res.responseBody = Blob.valueof(JSON.serialize(resBody));
            
        } catch (TypeException e) {
            res.statusCode = 400;
        } catch (System.QueryException e) {
            res.statusCode = 404;
        }
    }
    
    @HttpDelete
    // currently can only delete one record at a time
    global static void deleteTeam() {
        // Parse request parameters
        // Sanitizes Id input
        String teamId = String.escapeSingleQuotes(req.requestURI.substringAfter(sObjName + '/'));
        
        // return 400 if no Team Id provided
        if (teamId == '') {
            res.statusCode = 400;
        } else {
            try {
                Object resBody = SiteUtils.deleteSObject(sObjName, teamId);
                
                // Send response
                res.statusCode = 200;
                res.addHeader('Content-Type', 'application/json');
                res.responseBody = Blob.valueof(JSON.serialize(resBody));
            } catch (System.QueryException e) {
                res.statusCode = 404;
            } catch (System.NullPointerException e) {
                res.statusCode = 404;
            }
        }
    }
}