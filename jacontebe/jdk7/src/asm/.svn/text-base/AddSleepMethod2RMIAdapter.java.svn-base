package asm;

import org.objectweb.asm.MethodVisitor;

import edu.illinois.jacontebe.asm.AddSleepMethodAdapter;
import edu.illinois.jacontebe.asm.CodeTemplate;

public class AddSleepMethod2RMIAdapter extends AddSleepMethodAdapter {

    public AddSleepMethod2RMIAdapter(MethodVisitor mv, long sleepTime) {
        super(mv, sleepTime);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void visitMethodInsn(int opcode, String owner, String name,
            String desc, boolean itf) {
        mv.visitMethodInsn(opcode, owner, name, desc, itf);
        if (opcode == INVOKESPECIAL) {
            new CodeTemplate(mv).addSleepCodes(sTime);
        }
    }

}
