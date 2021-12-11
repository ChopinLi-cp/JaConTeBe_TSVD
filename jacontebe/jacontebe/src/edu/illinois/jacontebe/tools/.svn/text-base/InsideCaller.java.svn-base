package edu.illinois.jacontebe.tools;

import java.lang.reflect.Method;

/**
 * This class is to call a private method from a class by reflection.
 * 
 * @author Ziyi Lin
 * 
 */
public class InsideCaller {

    private final Class<? extends Object> clazz;
    private final Object obj;

    public InsideCaller(Object obj) {
        this.obj = obj;
        clazz = obj.getClass();
    }

    public Object callPrivateMethod(String methodName, Class[] classes,
            Object... params) throws Exception {
        Method method = clazz.getDeclaredMethod(methodName, classes);
        method.setAccessible(true);
        return method.invoke(obj, params);
    }
}
