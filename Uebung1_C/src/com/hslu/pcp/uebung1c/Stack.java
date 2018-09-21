package com.hslu.pcp.uebung1c;

public class Stack {

    private int count;
    private Element topElement;

    public void push(Element element){
        if(topElement != null){
            element.setNext(topElement);
        }
        topElement = element;
        count++;
    }

    public Element top(){
        return topElement;
    }

    public Boolean pop(){
        topElement = topElement.getNext();
        count --;
        return true;
    }

    public void print(){

        if(topElement == null) {
            System.out.println("print - Stack is empty");
            return;
        }

        System.out.print("print - Stack contains: ");

        boolean hasNextElement = false;
        Element elementToPrint = topElement;

        do {
            System.out.print(elementToPrint.getValue());
            System.out.print(",");

            Element nextElement = elementToPrint.getNext();
            if(nextElement != null){
                hasNextElement = true;
                elementToPrint = nextElement;
            }
            else{
                hasNextElement = false;
            }
        }while(hasNextElement);
        System.out.print("top Element = ");
        System.out.println(topElement.getValue());
    }

    public boolean isEmpty(){
        if(topElement == null){
            return true;
        }
        return false;
    }

    public int size(){
        return count;
    }
}
