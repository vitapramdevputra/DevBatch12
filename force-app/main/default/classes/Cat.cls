public class Cat {
    public string name;
    public string color;
    public static integer countCat = 0;
    //consturctor is called automatic 
    //when we create new INSTANCE of class.
    //1. what is name of constructor? Cat. Same as class Name.
    //2. what is return type of constructor? NO return type. Not even void. IT DOESN'T RETURN ANYTHING.
    
    public Cat() {
        system.debug('cat consturctor called.');
        countCat++;
    }
    public Cat(string n, string clr){
        name = n;
        color = clr;
        countCat++;
        sleeping();
    }
    public void sleeping(){
        system.debug(name + ' isss sleeeping.');
    }
   
}
