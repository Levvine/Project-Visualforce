public class CPUController {
	// creates a new computer contact if there isn't one,
	// and retrieves if it exists.
    public static Contact trainer {
        get {
            Contact trainer;
            try {
            	trainer = [SELECT Name FROM Contact WHERE Type__c='CPU'];
            } catch (QueryException e) {
                if (e.getMessage() == 'List has no rows for assignment to SObject') {
                    trainer = new Contact(LastName='CPU1', Type__c='CPU');
					insert trainer;
                } else {
                    System.debug('Multiple AI trainers found when controller was designed to accommodate a single one.');
                }
            }
            
            return trainer;
        }}
}