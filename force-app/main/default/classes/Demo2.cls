public class Demo2 {
    public string word; //instance member variable
    private static final string const_string; //static member variable
    
    static{
        const_string = 'Hello World!'; //static initializer block
    }
    
    public Demo2(){
		this(const_string); //Constructor
    }
    
    public Demo2(string newstring){
		this.word = newstring; //overloaded constructor
    }
    
    public void outputword(){
        system.debug('Display text: ' + word); //method
    }
    
    public static void outputword1(){
		system.debug('Display from static method'); //call from a static method
    
    }

}

//invoking a both static and instance methods
/*
Demo2 d1 = new Demo2();
d1.outputword();

Demo2 d2 = new Demo2('Hello Opeyemi');
d2.outputword(); //this are meant for instance

Demo2.outputword1(); // this is meant for static method*/