public class BitOprtNotChangeVariableValue {
    public static void main(String[] args) {
        int a = 0x400;

        System.out.println(a >> 2);
        System.out.println(~a);
        System.out.println(a | 0x8);

        System.out.println(a);
    }
}
