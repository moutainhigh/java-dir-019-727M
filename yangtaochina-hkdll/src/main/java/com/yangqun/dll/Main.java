package com.yangqun.dll;

import com.sun.jna.Pointer;
import com.sun.jna.ptr.PointerByReference;

public class Main {
    public static void main(String[] args) {
        MVIDCodeReader mvidCodeReader = MVIDCodeReader.INSTANCE;
        PointerByReference pointerByReference  = new PointerByReference();
        int i = mvidCodeReader.MVID_CR_CreateHandle(pointerByReference, 3);
        Pointer pointer = pointerByReference.getPointer();

        System.out.println(i);
        System.out.println(pointer);
        System.exit(0);
    }
}
