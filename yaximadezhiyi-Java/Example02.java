public class Example02 {
    public static void main(String[] args) {
        int a = 90;
        int b = 95;
        int c = 99;

        if (a == b && b == c) {
            System.out.println("a,b和c等大，大小为" + a);
        } else {
            if (a > b) {
                if (a > c) {
                    System.out.println("a是最大的值，为" + a);
                } else {
                    if (a == c) {
                        System.out.println("a和c是最大的值，为" + a);
                    } else {
                        System.out.println("c是最大的值，为" + c);
                    }
                }
            } else {
                //a<=b
                if (b > c) {
                    if (a == b) {
                        System.out.println("a和b等大，为" + b);
                    } else {
                        System.out.println("b最大，为" + b);
                    }
                } else {
                    //b<=c
                    if (c == b) {
                        System.out.println("b和c等大，为" + c);
                    } else {
                        System.out.println("c最大，为" + c);
                    }
                }
            }
        }
    }
}