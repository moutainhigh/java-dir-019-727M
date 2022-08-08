public class BitOprtUsage {
    public static void main(String[] args) {
        int base = 1;// 0001
        int is_student_mask = base;// 0001
        int is_programmer_mask = base << 1;// 0010
        int is_driver_mask = base << 2;// 0100
        int is_painter_mask = base << 3;// 1000

        int date = 5;// 0101

        boolean isStudent = (date & is_student_mask) != 0;// 0101 和 0001
        System.out.println(isStudent);

        boolean isProgrammer = (date & is_programmer_mask) != 0;// 0101 和 0010
        System.out.println(isProgrammer);

        boolean isDriver = (date & is_driver_mask) != 0;// 0101 和 0100
        System.out.println(isDriver);

        boolean isPainter = (date & is_painter_mask) != 0;// 0101 和 1000
        System.out.println(isPainter);
    }
}
