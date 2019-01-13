package com.hslu.pcp.javaExcercises;

import java.util.Arrays;
import java.util.Optional;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.IntStream;

public class Main {

    public static void main(String[] args) {
        printNumbersAndSquares(new Integer[] {1, 2, 3, 5, 8});

        TripleIntOperator tio = (int x, int y, int z) -> x + y + z;
        int r = tio.operate(1, 2, 3);

        String res = processNames(new String[] {"Susanna", "Joe", "Lu", "Timmy", "Rafael", "Lisa"});
        iterateToHundred();
        endlessInt();
    }

    public static void printNumbersAndSquares(Integer[] numbers) {
        Arrays.stream(numbers).forEach(x -> {
            System.out.print(x);
            System.out.print(": ");
            System.out.println(x * x);
        });
    }

    public static String processNames(String[] names){
        Optional<String> resultString = Arrays.stream(names)
                                            .filter(x -> x.length() == 3 || x.length() == 4)
                                            .map(String::toUpperCase)
                                            .reduce((s, s2) -> s + " " + s2);

        return resultString.isPresent() ? resultString.get() : "";
    }

    public static void iterateToHundred(){
        IntStream.iterate(0, i -> i+1)
                .limit(100)
                .parallel()
                .forEach(x -> System.out.print(x + ", "));
        System.out.println("");
    }

    public static void endlessInt(){
        AtomicInteger count = new AtomicInteger();
        new Random().ints().anyMatch(value -> {
            count.getAndIncrement();
            return value >= 10000 && value <= 12000;
        });

        System.out.println("Found suitable number at stream position " + count);
    }

    @FunctionalInterface
    public interface TripleIntOperator{
        int operate(int a, int b, int c);
    }
}
