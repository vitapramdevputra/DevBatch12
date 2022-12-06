public class Calculator2 {
    public static void welcomeMessage(){
        system.debug('welcome to apex calculator2');
    }
    public static void printNewMessage(string str){
        system.debug(str);
    }

    public static integer add(integer a, integer b) {
        return (a+b);
    }

    public static integer add(integer x, integer y, integer z) {
        return (x+y+z);
    }
}
