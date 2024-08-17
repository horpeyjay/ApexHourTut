public with sharing class BasicSyntaxDemo {
    /*Variables and Data Types:

    Create an Apex class named BasicSyntaxDemo.
    Declare variables of different data types (integer, string, boolean, double).
    Initialize these variables and print their values using System.debug().*/
    public void basicSyntax() {
        String text = 'Just testing';
        Integer someNumbers = 25;
        System.debug('Integer: ' + someNumbers);
        someNumbers += 10;
        System.debug('Just testing out some shorthand. The new total sum is ' + someNumbers);
        Boolean isCheck = false;
        Double deciNumber = math.PI * 90;
        System.debug('String: ' + text);
        System.debug('Boolean: ' + isCheck);
        System.debug('Double: ' + deciNumber);

        Contact newContact = new Contact();
        newContact.FirstName = 'Apex';
        newContact.LastName = 'Hour';
        newContact.Phone = '009348783';
        //newContact.AccountId = '001J9000004mJ7uIAE';
        System.debug('New Contact: ' + newContact);
    }
    /*ASSIGNMENT 2Control Flow - Conditional Statements:

    In the BasicSyntaxDemo class, write a method named checkEvenOrOdd that takes an integer as a parameter.
    Use an if-else statement to check if the number is even or odd.
    Print "Even" or "Odd" based on the result.*/
    public Boolean checkEvenOrOdd (integer num){
        if (num >= 2){
            if (Math.mod(num, 2) == 0){
                system.debug('the number is even');
                return true;
            }else{
                system.debug('the number is odd');
                return false;
            }
        }else{
            System.debug('oops, you need to enter a number greater than 1');
            return null;
        }
        
    }
    /*Control Flow - Loops:
    Write a method named printNumbers that prints numbers from 1 to 10 using a for loop.
    Write another method named printEvenNumbers that prints even numbers between 1 and 20 using a while loop.*/
    public void printNumbers(integer num1){
        for (integer i = 1; i <= num1; i++){
            system.debug('The current number in the loop is ' + i);
        }
    }
    public void printEvenNumbers(integer num1){
        List<Integer> pen = new List<Integer>();
        integer j = 2;
        while (j <= num1){
            integer leftOver = math.mod (j, 2);
            if (leftOver == 0){
                //system.debug ('The current number is ' + num1 + ' which is an even number');
                pen.add(j);
            }
            j++;
        }
        system.debug('The array of even numbers in a given list of number is ' + pen);
        system.debug('The size of the even number is ' + pen.size());
    }
    //ASSIGNMENT 3:
    //Write a method named print_sum_of_n_numbers that takes an integer parameter n and prints the sum of n numbers.
}