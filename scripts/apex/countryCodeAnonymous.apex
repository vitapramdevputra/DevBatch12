//access custom setting here.
Map<string, country_code__c> allCountryCode = country_code__c.getAll();
system.debug('all country code --> ' + allCountryCode);

//country name India, its code is IND

for (string eachCountry : allCountryCode.keyset()) {
    country_code__c cc =  allCountryCode.get(eachCountry);
    system.debug('Country name is ' + eachCountry + ', its code is ' + cc.code__c);
}