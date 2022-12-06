map<string, string> mapCntCurrency = new map<string, string>();
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('Germany', 'Euro');
mapCntCurrency.put('Japan', 'Yen');
mapCntCurrency.put('India', 'Rupees');
mapCntCurrency.put('India', 'Rs');
mapCntCurrency.put('India', 'Rupee');
mapCntCurrency.put('Turkiye', 'Lira');
mapCntCurrency.put('El Salvador', 'Bitcoin');
system.debug('map of country and currency ' + mapCntCurrency);

string IndiaCurrency = mapCntCurrency.get('India');
system.debug('India currency is ... ' + IndiaCurrency);
String country = 'France';
string countryCurrency = mapCntCurrency.get(country);//work or no?
system.debug(country + ' currency is ... ' + countryCurrency);

//keySet --> returns set<key_datatype>
Set<String> countrySet = mapCntCurrency.keySet();
system.debug('set of country is ... ' + countrySet);

//values() --> returns List<value_datatype>
list<string> currencyList = mapCntCurrency.values();
system.debug('currency list is... ' + currencyList);

//keyset --> set of keys (country)
set<string> countries = mapCntCurrency.keySet();
for(string eachCountry : countries){
    system.debug('* each country is ' + eachCountry);
    string eachCurrency = mapCntCurrency.get(eachCountry);
    system.debug('** each currency is ' + eachCurrency);
    system.debug('--> country is ' + eachCountry + ', its currency is ' + eachCurrency);
}