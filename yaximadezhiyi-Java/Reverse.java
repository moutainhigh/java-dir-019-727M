public class Reverse {
    public static void main(String[] args) {
        int origin = 0x000000FF;
        int originReverse = ~origin;
        int originReverseManually = 0xFFFFFF00;
        System.out.println(origin);
        System.out.println(originReverse);
        System.out.println(originReverseManually);
    }
}

