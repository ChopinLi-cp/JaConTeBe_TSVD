package edu.illinois.jacontebe.asm;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Opcodes;

/**
 * This class generates a class at runtime by ASM.
 * @author Ziyi Lin
 * 
 */
public class ClassGenerator implements Opcodes {

    /**
     * Generate a very simple interface with given name. This interface has only
     * one method.
     * 
     * @param interface name. For example: package/interfacename
     * @return Class of generated interface.
     */
    public Class generateSampleInterface(String name) {
        byte[] classBytes = generateSimpleInterface(name);
        SimpleClassLoader classLoader = new SimpleClassLoader();
        return classLoader.definClass(name, classBytes);
    }

    private byte[] generateSimpleInterface(String className) {
        ClassWriter cw = new ClassWriter(0);
        cw.visit(V1_6, ACC_PUBLIC + ACC_ABSTRACT + ACC_INTERFACE, className,
                null, "java/lang/Object", null);

        cw.visitMethod(ACC_PUBLIC + ACC_ABSTRACT, "printHello", "()V", null,
                null).visitEnd();
        cw.visitEnd();
        return cw.toByteArray();
    }
}
