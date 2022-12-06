public class Car {
    public string carColor = '';
    public string carName;
    //if we don't write access modifier. Default is Private.
    private integer maxSpeed = 150;
    //chnage in vs code
    public void switchOn(){
        datetime switchOnTime = datetime.now();
        System.debug('starting the car');
    }
    public void drive(){
        system.debug('driving ' + carName + ', color is ' + carColor);
    }
    public void driveAtMaxSpeed(){
        string drivingDescription = 'Driving ' + carName + ' at ' + maxSpeed + 'km/h';
        system.debug(drivingDescription);
    }
}
