//instance of the class = object
//classname   variable      new instance.
Car lambo = new car();
lambo.carColor = 'Orange';
lambo.carName = 'Lambo sports';
lambo.switchOn();
lambo.drive();
lambo.driveAtMaxSpeed();
System.debug('lambo -> ' + lambo);

System.debug('---------------');
Car bmw = new car();
bmw.carColor = 'White';
bmw.carName = 'Bmw suv';
system.debug('bmw.carColor - > ' + bmw.carColor);
bmw.switchOn();
bmw.drive();
system.debug('bmw --> ' + bmw);

System.debug('---------------');

Car nissan = new car();
nissan.switchOn();
system.debug('nissan --> ' + nissan);
