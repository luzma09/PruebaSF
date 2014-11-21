global class TestWebSercice {
	webservice static Id submitValue(integer iValor){
		integer iValue = 5;
		Asignacion__c asignacion = new Asignacion__c();
		asignacion.Valor__c = iValor;
		insert asignacion;
		return asignacion.Id;
	}

}