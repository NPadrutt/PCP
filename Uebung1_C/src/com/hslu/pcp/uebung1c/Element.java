package com.hslu.pcp.uebung1c;

public class Element {

    private int value;
    private Element nextElement;

    public Element (int value) {
        this.value = value;
    }

    public int getValue(){
        return value;
    }

    public Element getNext(){
        return nextElement;
    }

    public void setNext(Element element){
        nextElement = element;
    }
}
