public class ForEachLoopDemo1 {
    public static void iterateIntegerList() {
        List<integer> listInteger = new list<integer>();
        listInteger.add(10);//0 //indexes will always be integer.
        listInteger.add(15);//1
        listInteger.add(21);//2
        listInteger.add(15);//3
        listInteger.add(15);//4

        //print each element one by one. That's it.
        for (integer eachInteger : listInteger) {
            system.debug(eachInteger);
        }
    }

    public static integer add(list<integer> intList) {
        //temp variable to store addition.
        integer returnInt = 0;
        for (integer eachInte : intList) {
            //add eachInte to returnInt
            system.debug('eachInte --> ' + eachInte);
            returnInt = returnInt + eachInte;
            system.debug('returnInt --> ' + returnInt);
        }
        return returnInt;
    }
}
