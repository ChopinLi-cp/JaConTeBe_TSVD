package edu.illinois.jacontebe.asm;

import java.util.List;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

/**
 * This class adds code into a specified method.
 * 
 * @author Ziyi Lin
 * 
 */
public class TransformMethodAdapter extends ClassVisitor implements Opcodes {

    private MvFactory factory;
    private List<MethodInfor> methodInfor;

    public TransformMethodAdapter(ClassVisitor cv,
            List<MethodInfor> methodInformations, MvFactory mvFactory) {
        super(ASM5, cv);
        this.factory = mvFactory;
        this.methodInfor = methodInformations;
    }

    private boolean contains(String name, String desc) {
        for (MethodInfor mi : methodInfor) {
            if (name.equals(mi.getMethodName())
                    && desc.equals(mi.getMethodDescription())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public MethodVisitor visitMethod(int access, String name, String desc,
            String signature, String[] exceptions) {
        MethodVisitor mv = cv.visitMethod(access, name, desc, signature,
                exceptions);
        if (mv != null && contains(name, desc)) {
            mv = factory.generateMethodVisitor(mv, name, desc);
        }
        return mv;
    }
}
