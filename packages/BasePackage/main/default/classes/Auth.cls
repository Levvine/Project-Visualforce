public class Auth {
    
    public static Contact trainer {
        get{  
            if (trainer == null) {
                trainer = [SELECT Name from Contact WHERE Type__c!='CPU' LIMIT 1];
            }
            return trainer;
        }
        private set;
    }

}