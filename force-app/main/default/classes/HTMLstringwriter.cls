public class HTMLstringwriter extends StringWriter {
    
    public override void printString(){
        system.debug('<p>This is an HTML string </p>');
    }

}

//Call both the StringWriter and the HTMLStringwriter class using the extension function
/*Just instantiate the class
StringWriter sw1 = new StringWriter();
sw1.printString();

//for the Html writer
HTMLstringwriter sw2 = new HTMLstringwriter();
sw2.printString();
*/