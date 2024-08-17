public with sharing class CollectionDemo {
    public List<Integer> listDemo() {
        List<Integer> newList1 = new List<Integer>{10, 20, 30, 40, 50};
        system.debug ('the new array of list is ' + newList1);
        newList1.add(10);
        System.debug('Wanted to check if the list accepts duplicates ' + newList1);
        System.debug('The size of the list is ' + newList1.size());
        return newList1;
    }

    public void setDemo(){
        Set<String> setOfLetters = new Set<String>();
        setOfLetters.add('Hello');
        setOfLetters.add('How');
        setOfLetters.add('Are');
        setOfLetters.add('You');
        setOfLetters.add('Are');
        System.debug('Wanted to check if the list accepts duplicates ' + setOfLetters);
        system.debug('The size of the set is ' + setOfLetters.size());
    }
    public String mapDemo(){
        Map<Integer, String> intToStringMap = new Map<Integer, String>();
        intToStringMap.put(1, 'First entry');
        intToStringMap.put(2, 'Second entry');
        intToStringMap.put(3, 'Third entry');
        intToStringMap.put(4, 'Fourth entry');
        intToStringMap.put(4, 'Fifth entry');
        system.debug('Wanted to check if the list accepts duplicates ' + intToStringMap);
        system.debug('The item on the list 3 is ' + intToStringMap.get(3));
        system.debug('The size of the map is ' + intToStringMap.size());
        return intToStringMap.get(2);
    }

    /*List and Conditional Statements:

    In the CollectionDemo class, write a method named filterEvenNumbers that:
    Takes a list of integers as a parameter.
    Uses a for loop to iterate through the list.
    Creates a new list to store even numbers.
    Adds even numbers to the new list and prints it.*/

    public List<Integer> filterEvenNumbers(Integer numberList1){
        List<Integer> newList1 = new List<Integer>();
        for (integer i = 1; i <= numberList1; i++ ) {
            if (math.mod(i, 2) == 0){
                newList1.add(i);
            }
            else {
                //system.debug('The number ' + i + ' is an odd number and not added to the list of even numbers.');
            }
        }
        
        system.debug('The array of even number in ' + numberList1 + ' is ' + newList1);
        system.debug('The size of the array of even numbers is ' + newList1.size());
        return newList1;
    }

    /*
    In the CollectionDemo class, write a method named setOperations that:
    Takes two sets of integers as parameters.
    Finds the union, intersection, and difference of the sets.
    Prints the results.

    */

    public void setOperations(Set<Integer> set1, Set<Integer> set2){
        Set<Integer> unionSet = new Set<Integer>();
        //Do the union of both sets
        //METHOD 1
        unionSet.addAll(set1);
        unionSet.addAll(set2);
        system.debug('The union of the sets using method 1is ' + unionSet);
        system.debug('The size of the union set is ' + unionSet.size());

        //another method for getting the union
        //METHOD 2
        set1.addAll(set2);
        system.debug('The union of the sets using method 2 is ' + set1);
        system.debug('The size of the union set is ' + set1.size());

        //Getting the intersection between two set of numbers
        Set<Integer> intersectionSet = new Set<Integer>();
         
        intersectionSet.addAll(set1);
        intersectionSet.retainAll(set2);

        system.debug('The intersection of the two sets using method 1 are ' + intersectionSet);
        system.debug('The size of the intersection set is ' + intersectionSet.size());
        //Trying out another method for the intersection
        for(Integer i : set1){
            if(set2.contains(i)){
                intersectionSet.add(i);
            }
        }
        system.debug('The intersection of the two sets using method 2 are ' + intersectionSet);
        system.debug('The size of the intersection set is ' + intersectionSet.size());
        
        //This is to get the difference between 2 sets. 
        //METHOD 1
        Set<Integer> differenceSet = new Set<Integer>();
        differenceSet.addAll(set1);
        differenceSet.removeAll(intersectionSet);
        system.debug('The difference of the two sets using method 1 is ' + differenceSet);
        system.debug('The size of the difference set is ' + differenceSet.size());
        //METHOD 2 
        differenceSet.addAll(set1);
        differenceSet.removeAll(set2);
        system.debug('The difference of the two sets using method 1 is ' + differenceSet);
        system.debug('The size of the difference set is ' + differenceSet.size());
    }

    /* Map and Loop:

        In the CollectionDemo class, write a method named mapLoop that:
        Takes a map of string keys and integer values as a parameter.
        Uses a for loop to iterate through the map entries.
        Prints each key and value.*/
    public void mapLoop(Map<String,Integer> mapCollection){
        for(String key : mapCollection.keySet()){
            system.debug('The key is ' + key + ' and the value is ' + mapCollection.get(key));
        }
        
    }


        /*Nested Collections:

        In the CollectionDemo class, write a method named nestedCollections that:
        Initializes a map with string keys and list values.
        Adds lists of integers to the map.
        Uses nested loops to print each key and the corresponding list elements.*/
        public void nestedCollections() {
            List<String> classRoom = new List<String>();
            List<Integer> totalPupilsPerClass = new List<Integer>();
        
            // Initialize the classrooms
            for (Integer grade = 1; grade <= 5; grade++) {
                classRoom.add('Grade ' + grade);
            }
        
            // Number of students per grade
            List<Integer> numberOfBoys = new List<Integer>{10, 11, 23, 34, 67};
            List<Integer> numberOfGirls = new List<Integer>{13, 18, 33, 30, 107};
        
            // Loop through classrooms to calculate students
            for (Integer classIndex = 0; classIndex < classRoom.size(); classIndex++) {
                String currentClass = classRoom[classIndex];
        
                // Ensure the index is within bounds of the student lists
                if (classIndex < numberOfBoys.size() && classIndex < numberOfGirls.size()) {
                    System.debug('The number of boys in ' + currentClass + ' is ' + numberOfBoys[classIndex] +
                                 ' and the number of girls in ' + currentClass + ' is ' + numberOfGirls[classIndex] + '.');
                    Integer totalStudents = numberOfBoys[classIndex] + numberOfGirls[classIndex];
                    System.debug('The total number of students in ' + currentClass + ' is ' + totalStudents + '.');
                    totalPupilsPerClass.add(totalStudents);
                }
            }
        
            // Create a map to store total students per classroom
            Map<String, Integer> mapOfList = new Map<String, Integer>();
            for (Integer classIndex = 0; classIndex < classRoom.size(); classIndex++) {
                mapOfList.put(classRoom[classIndex], totalPupilsPerClass[classIndex]);
            }
        
            System.debug('The map of the list of students per classroom is ' + mapOfList);
        }

}