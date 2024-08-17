public class MathCalculator {
    private Integer number1;
    private Integer number2;
    private Integer sum;
    private Integer product;
    private Integer minus;
    
    public void setNumber(Integer num1, Integer num2) {
        this.number1 = num1;
        this.number2 = num2;
    }
    
    public void doMath() {
        addition();
        multiplication();
        this.minus = subtract(this.number1,  this.number2);
        printMessage();
    }
    public Integer subtract(Integer sub1, Integer sub2) {
        sub1 = this.number1;
        sub2 = this.number2;
        if (sub1 < sub2) {
            minus = sub2 - sub1;
            
        } else if (sub1 > sub2) {
            minus = sub1 - sub2;
            
        }
        
        return minus;
        
    }
    
    private void addition() {
        this.sum = this.number1 + this.number2;
    }
    
    private void multiplication() {
        this.product = this.number1 * this.number2;
    }
    
    private void printMessage() {
        System.debug('The addition of the numbers is ' + this.sum);
        System.debug('The multiplication of the numbers is ' + this.product);
        System.debug('The subtraction of the two numbers is' + minus);
    }
}