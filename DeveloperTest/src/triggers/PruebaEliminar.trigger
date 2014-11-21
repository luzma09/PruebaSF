trigger PruebaEliminar on Asignacion__c (after update) {
	//trigger.new
	//trigger.old
}
/*
trigger SendEmailOnOwnerChange on Lead (before update,After Update) {  
   if (trigger.old[0].OwnerId != trigger.new[0].OwnerId ) {  
     //Procesamiento de la información.  
   }  
 } 
*/

/*
trigger Object__c on Opportunity (after update) {
  for (Opportunity opp : Trigger.new) {
    // Access the "old" record by its ID in Trigger.oldMap
    Opportunity oldOpp = Trigger.oldMap.get(opp.Id);

    // Trigger.new records are conveniently the "new" versions!
    Boolean oldOppIsWon = oldOpp.StageName.equals('Closed Won');
    Boolean newOppIsWon = opp.StageName.equals('Closed Won');
    
    // Check that the field was changed to the correct value
    if (!oldOppIsWon && newOppIsWon) {
      opp.I_am_Awesome__c = true;
    }
  }
}
*/