SetDemo.citySet();
SetDemo.randomIntegerSet();

List<integer> listInteger = new list<integer>();
listInteger.add(10);//0 
listInteger.add(15);//1
listInteger.add(21);//2
listInteger.add(15);//3
listInteger.add(15);//4
set<integer> setInteger = SetDemo.setFromList(listInteger);
system.debug('set -> ' + setInteger);


 set<string> cities = new set<string>();
cities.add('Tokyo');
cities.add('Lisbon');
cities.add('Nairobi');
cities.add('Berlin');
cities.add('Berlin');
cities.add('Nairobi');
cities.add('Tokyo');
cities.add('TOKYO');
set<string> uppercaseCities = SetDemo.uppercaseSet(cities);
system.debug(uppercaseCities);