public class retrieveAsignacion {
	
	Asignacion__c asignacion;
    
    public String getContactAsignacion() {
        return 'Babara Levy';
    }

    public List<Asignacion__c> getAsignaciones() {
        return [SELECT id, Valor__c FROM Asignacion__c];
    }
    
    public PageReference save() {
	    try{
	        update asignacion;
	       }
	    catch(DmlException ex){
	        ApexPages.addMessages(ex);
	       }
	    return null;
	}
  
  public Asignacion__c getAsignacion() {
    if(asignacion == null){
    	asignacion = [select id, Valor__c from Asignacion__c where id = :ApexPages.currentPage().getParameters().get('id')];
    }
    return asignacion;
  }
}