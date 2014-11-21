public class DetalleCertificacion_ctr{
	 
	public String idAccount;
	
    public DetalleCertificacion_ctr(ApexPages.StandardController ctr){
    	//idAccount = ctr.getId();
    	//system.debug('id de la cuenta '+ idAccount);
    }
	
	public PageReference sendME() {
		Messaging.reserveSingleEmailCapacity(2);
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		
		//PageReference pdf = Page.DetalleCertificacion;
    	Blob bBlob = Page.attachmentPDF.getContent();
    	Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
	    efa.setFileName('attachment.pdf');
	    efa.setBody(bBlob);
	    mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
	    
	    String[] toAddresses = new String[] {'ljimenez@avanxo.com'}; 
	    //String[] toAddresses = new String[] {la[0].correo__c};
	    mail.setToAddresses(toAddresses);
	    mail.setSenderDisplayName('Luz Maria Jimenez');
	    mail.setSubject('Estado liberaci�n MS');
	    mail.setPlainTextBody('Estimado usuario,');
		mail.setHtmlBody('<b>Se genero el PDF...</b>');
	    
	    try{
		    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	    	system.debug('envio de email fin');
    	}catch(EmailException  e){
    		system.debug('error '+ e.getMessage());
    	}
    	return null;
	}
}