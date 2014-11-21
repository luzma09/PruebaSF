global class EmailSender_cls {
    // Clase que permite el env�o de correos para confirmaci�n de proceso.
    // Versi�n: 1.0	
    // Ultima actualizaci�n: Julio 22 de 2008 (WP) -> versi�n original: (OC)
    webservice static string SendEmail_ws(string mailPARA, string mailCC, string mailReplyTo, string strSenderName, string strSubject, string strMessage, boolean isHTML){
		// Permite el env�o de correo a trav�s de Salesforce
        System.debug('\n\n###Clase->Email... \nPara: '+mailPARA+' \nCC: '+mailCC+' \nReply To: '+mailReplyTo+'\nSender Name: '+strSenderName);
        // Create a new single email message object
        // that will send out a single email to the addresses in the To, CC & BCC list.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String[] {mailPARA};
        if(mailCC != null || mailCC != ''){
        	String[] ccAddresses = mailCC.split(';');
        	//new String[] {mailCC};
        	mail.setCcAddresses(ccAddresses);
        }
        // Assign the addresses for the To and CC lists to the mail object.
        mail.setToAddresses(toAddresses);
        // Specify the address used when the recipients reply to the email.
        mail.setReplyTo(mailReplyTo);
        // Specify the name used as the display name.
        mail.setSenderDisplayName(strSenderName);
        // Specify the subject line for your email address.
        mail.setSubject(strSubject);
        // Set to True if you want to BCC yourself on the email.
        mail.setBccSender(false);
        // Optionally append the salesforce.com email signature to the email.
        // The email address of the user executing the Apex Code will be used.
        mail.setUseSignature(false);
        // Specify the text content of the email.
        //mail.setPlainTextBody('El usuario '+apellidoUsuario+' le ha asignado una tarea en Salesforce');
      	//Sandbox
        //mail.setHtmlBody('El usuario<b> '+apellidoUsuario+' </b> le ha asignado una tarea en Salesforce<p><div align=\"Justify\">'+Tarea.Subject+'<br/>'+Tarea.Description+'</div><br/>'+
        //' <a href=https://cs2.salesforce.com/'+Tarea.Id+'>haga clic aqui para ver el detalle</a>');
        //producci�n
        //contenido='El usuario<b> '+apellidoUsuario+' </b> le ha asignado una tarea en Salesforce<p><div align=\"Justify\">Asunto: '+Tarea.Subject;
        //contenido=contenido+'<br/><br/>Descripci�n: '+Tarea.Description+'</div>';
        //mail.setHtmlBody(contenido+'<br/>'+
        //' <a href=https://cs2.salesforce.com/'+Tarea.Id+'>haga clic aqui para ver el detalle</a>');
        if(isHTML){
        	mail.setHtmlBody(strMessage);
        }else{
        	mail.setPlainTextBody(strMessage);
        }
        // Send the email you have created.
        try{
        	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
        catch(Exception ex){
        	System.debug('\n\n  No se pudo enviar'+ex+' \n\n');
        }
        return 'Enviado';
      }
}