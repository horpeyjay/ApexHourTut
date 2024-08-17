public class SumOfPrimeNumbers {
    public void primeNumbers (integer maxNumber){
        integer sum = 0;
        for (integer i = 0; i <= maxNumber; i++){
            Double remainder = math.mod(i, 2);
            Double remainder1 = math.mod(i, 3);
            Double remainder2 = math.mod(i, 5);
            Double reminder3 = math.mod(i, 7);
            
            if (remainder == 0 && remainder1 == 0 && remainder2 == 0 && reminder3 == 0) {
                system.debug('The sum of the prime numbers is ' + i);
                sum += i;
            }
        }
    }
}