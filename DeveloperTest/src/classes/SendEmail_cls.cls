public class SendEmail_cls{
    
	private final Account account;
	
	public Account getAccount() {
		return account;
	}
	
    public SendEmail_cls(ApexPages.StandardController ctr) {
    	account = [select Name, (SELECT Contact.Name, Contact.Email FROM Account.Contacts) 
				from Account where id = :ApexPages.currentPage().getParameters().get('id')];
    }
    
    public PageReference send() {
    
    	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    	
        PageReference pdf = Page.DetalleCertificacion;
    	pdf.setRedirect(true);
    	Blob bBlob = pdf.getContent();
    	Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
	    efa.setFileName('attachment.pdf');
	    efa.setBody(bBlob);
	    String[] toAddresses = new String[] {'ljimenez@avanxo.com'}; 
	    //String[] toAddresses = new String[] {la[0].correo__c};
	    mail.setToAddresses(toAddresses);
	    mail.setSenderDisplayName('Luz Maria Jimenez');
	    mail.setSubject('Estado liberaci?n MS');
	    mail.setPlainTextBody('Estimado usuario,');
		mail.setHtmlBody('<b>Se genero el PDF...</b>');
	    
	    mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
	    
	    try{
		    //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	    	system.debug('envio de email fin');
    	}catch(EmailException  e){
    		system.debug('error '+ e.getMessage());
    	}
    	return null;
    }
}