package edu.illinois.jacontebe.asm;

/**
 * 
 * @author Ziyi Lin
 * 
 */
public class SimpleClassLoader extends ClassLoader {

    public Class definClass(String name, byte[] b) {
        return defineClass(name, b, 0, b.length);
    }
}
