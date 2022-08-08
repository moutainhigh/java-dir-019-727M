public class ForceConvert {
    public static void main(String[] args) {
        //强制类型转换
        int intVal = 99;
        long longVal = 19999;
        intVal = (int) longVal;

        float floatVal = 11.32f;
        double doubleVal = 3344556.789;
        floatVal = (float) doubleVal;

        int a = 65 + 10;
        char b = (char) a;
        System.out.println(b);
     }
}
