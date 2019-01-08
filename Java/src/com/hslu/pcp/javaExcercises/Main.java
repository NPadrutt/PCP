package com.hslu.pcp.javaExcercises;

import sun.security.ssl.Debug;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class Main {

    public static void main(String[] args) {

        /*
           1a) Es ist möglich, dass das Reduce Null zurückgibt (z.B. wenn names leer ist oder nicht genug Elemente enthält).
               Null ist eine häufige Fehlerqueller. Daher wird ein Optioanl zurückgegeben. Damit ist klar, dass unter Umständen
               kein Wert zurück kommt.

        */

        // 1b
        reduceAndPrintStrings(new String[] {"Joe", "Tara", "Sue", "Tim" });

        // 1c
        printOptional(reduceAndPrintStrings(new String[] {"Joe", "Tara", "Sue", "Tim" }), "[Default]");
        printOptional(reduceAndPrintStrings(new String[0]), "[Default]");

        // 2

    }

    public static Optional<String> reduceAndPrintStrings(String[] namesArray){
        List<String> names = Arrays.asList(namesArray);
        Optional<String> x = names
                .stream()
                .filter(s -> s.startsWith("T"))
                .map(s -> s.toUpperCase())
                .reduce((s, t) -> s + " " + t);

        if(x.isPresent()){
            System.out.println("[Debugoutput] x = " + x.get());
        }
        return x;
    }

    public static void printOptional(Optional<String> optionalString, String defaultValue){
        System.out.println("value = " + optionalString.orElse(defaultValue));
    }

    public void genereateSortAndPrintRandomInts(int numberOfVals, int maxValueExc){
        
    }
}
