public class RESTClient {
    
    RestRequest req;
    RestResponse res;
    
    public RESTClient() {
        req = RestContext.request;
        res = RestContext.response;
    }
    
    public void setStatus(Integer code) {
        res.statusCode = code;
    }
    
    public static void test() {
        // benchmarking different ways to retrieve an SObjectType
        Long time1 = DateTime.now().getTime();
        System.debug(Schema.Team__c.getSObjectType().getDescribe().name);
        Long time2 = DateTime.now().getTime();
        System.debug(time2-time1);
        
        Long time3 = DateTime.now().getTime();
        System.debug(((SObject) Type.forName('Team__c').newInstance())
                     .getSObjectType().getDescribe().name);
        Long time4 = DateTime.now().getTime();
        System.debug(time4-time3);
    }
    
}