public class Candidates {
    public string name;
    public string gender;
    public static string companyName;
    public static integer countCandidates = 0;

    public void printCandidates(){
        system.debug('name of candidate is ' + name + ', gender is ' + gender);
        system.debug('company name is ' + companyName);
    }

    public static void printCandidatesInfo(){
        //we CAN access static members in static method.
        system.debug('company name in static method is ' + companyName);
        //we CANNOT access NON STATIC members in static method
        //system.debug('name is ' + name);
    }
}
