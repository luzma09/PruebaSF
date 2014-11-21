public class EnviarEmail {
		
	public string nombreCuenta { 
		get; set;}
	
	public string fechaVinculacion{ 
		get; set;}
			
	public string numeroCuenta;
	public string sMes;
	public Account objAccount {get;Set;}
	
	/*
	getChars() Returns an array of character values that represent the characters in this string.
	*/
	public EnviarEmail(ApexPages.StandardController ctr)
	{
		//objAccount = [select name, Numero_identificacion__c, Fecha_de_vinculacion__c from Account where id = :ctr.getId() limit 1];
		objAccount = (Account)ctr.getRecord();
		nombreCuenta = objAccount.name.toUpperCase();	
		
		Map<String,String> monthMap = new Map<String,String>();
	    monthMap.put('1','Enero');
	    monthMap.put('2','Febrero');
	    monthMap.put('3','Marzo');
	    monthMap.put('4','Abril');
	    monthMap.put('5','Mayo');
	    monthMap.put('6','Junio');
	    monthMap.put('7','Julio');
	    monthMap.put('8','Agosto');
	    monthMap.put('9','Septiembre');
	    monthMap.put('10','Octubre');
	    monthMap.put('11','Noviembre');
	    monthMap.put('12','Diciembre');
	    
		fechaVinculacion = monthMap.get( string.valueOf( objAccount.Fecha_de_vinculacion__c.month() ) );
	}
	
	public void sendingEmail(){
		//Messaging.reserveSingleEmailCapacity(2);
	    
	    System.debug('envio correo controlador ');
	    
	    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	    
	    //string idAccount = String.valueOf(objAccount.id);
	    //001o0000009DOB1
	    
	    //PageReference pdf = new pagereference('/apex/attachmentPDF?scontrolCaching=1&id=001o0000009DOB1');
	    PageReference pdf = new pagereference('/apex/attachmentPDF?scontrolCaching=1&id=' + objAccount.Id);
	    
	    //PageReference pdf = Page.attachmentPDF();
	    // pagereference('/apex/attachmentPDF?id=' + idAccount);//( Page.attachmentPDF);
	    //Blob bBlob = pdf.put('Account.id',idAccount);//pdf.getContent();
	    
	    Blob bBlob = pdf.getContent();

	    /*PageReference pdf = Page.SendEmailPage;
	    Blob bBlob;
	    
	    try {
			// returns the output of the page as a PDF
	    	bBlob = pdf.getContent();
	
	    // need to pass unit test -- current bug  
	    } catch (VisualforceException e) {
	    	bBlob = Page.attachmentPDF.getContent();
	    }*/
	    
    	Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
	    efa.setFileName('attachment.pdf');
	    efa.setBody(bBlob);
	    mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
	    
	    String[] toAddresses = new String[] {'ljimenez@avanxo.com'}; 
	    mail.setToAddresses(toAddresses);
	    mail.setSenderDisplayName('Luz Maria Jimenez');
	    mail.setSubject('PDF Generado');
	    mail.setPlainTextBody('Estimado usuario,');
		mail.setHtmlBody('<b>Se genero el PDF...</b>');
	    
	    //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    	system.debug('envio de email fin');
	}
}