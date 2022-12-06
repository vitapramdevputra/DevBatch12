public class StringDemoClass {
   
   public void stringMethod1(){
        string sessionDescription = 'learning string methods in apex language';
        system.debug(sessionDescription);
         
        //1. get length of above string.
        integer sessionStrLength = sessionDescription.length();
        system.debug('length of session description string is ... ' + sessionStrLength);

        //2. Capital
        string capsSessionDesc = sessionDescription.toUpperCase();
        system.debug('in capitals -> ' + capsSessionDesc);

        //3. our string contains apex?
        Boolean containsApex = sessionDescription.contains('apex');
        system.debug('contains apex??? ' + containsApex);

        //3.1 check salesforce
        Boolean containsSF = sessionDescription.contains('salesforce');        
        system.debug('contains salesforce?' + containsSF);

        //3.2 our string contains Apex?
        Boolean containsApex2 = sessionDescription.contains('Apex');//'learning string methods in apex language'
        system.debug('contains Apex??? ' + containsApex2);//'apex' != 'Apex'

         //3.3 our string contains Apex?
         Boolean containsApex3 = sessionDescription.containsIgnoreCase('Apex');//'learning string methods in apex language'
         system.debug('contains ignore case Apex??? ' + containsApex3);

   }
}
