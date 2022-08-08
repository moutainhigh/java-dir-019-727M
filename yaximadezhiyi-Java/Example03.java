public class Example03 {
    public static void main(String[] args) {
        int a = 20;
        int b = 20;
        int c = 20;

        if (a == b && b == c) {
            System.out.println("a,b,c三者相等，值为" + a);
        } else {
            if (a > b) {
                if (a > c) {
                    System.out.println("a最大，值为" + a);
                } else {
                    if (a == c) {
                        System.out.println("a和c最大，值为" + a);
                    } else {
                        System.out.println("c最大，值为" + c);
                    }
                }
            } else {
                if (b > c) {
                    if (b == a) {
                        System.out.println("a和b最大，值为" + b);
                    } else {
                        if (b > a) {
                            System.out.println("b最大，值为" + b);
                        }
                    }
                } else {
                    if (b == c) {
                        System.out.println("b和c最大，值为" + b);
                    } else {
                        System.out.println("c最大，值为" + c);
                    }
                }
            }
        }
    }
}
