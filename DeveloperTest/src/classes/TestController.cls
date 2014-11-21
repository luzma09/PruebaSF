public class TestController {
		
	public string nombreCuenta { 
		get; set;}
	
	public string fechaVinculacion{ 
		get; set;}
			
	public string numeroCuenta;
	public string sMes;
	/*
	getChars() Returns an array of character values that represent the characters in this string.
	*/
	public TestController(ApexPages.StandardController ctr){
		Account cuenta = [select name, Numero_identificacion__c, Fecha_de_vinculacion__c from Account where id = :ctr.getId() limit 1];
		nombreCuenta = cuenta.name.toUpperCase();	
		
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
	    
		fechaVinculacion = monthMap.get(string.valueOf(cuenta.Fecha_de_vinculacion__c.month()));
	}
	
}