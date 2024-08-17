public class SumOfOddNumbers { //this is to sum the odd numbers with a particular given number range
    
    public void maxnumber(Integer max){
        integer sumofOddnumbers = 0;
        List<Integer> numberlist = new List<Integer>();
        for (integer i = 1; i <= max; i++){
            numberlist.add(i);
        }
        system.debug('The collection list is ' + numberlist);
        for(integer j = 0; j < numberlist.size(); j++){
            if(Math.mod(numberlist[j], 2) == 1){
				sumofOddnumbers = sumofOddnumbers + numberlist[j];
                //system.debug('The current number is ' + numberlist[j] + ' and the total sum of odd number is ' + sumofOddnumbers);
                
            }
        }
        system.debug('The total sum of odd number with the array is ' + sumofOddnumbers);
    }
    

}