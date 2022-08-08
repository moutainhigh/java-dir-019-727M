package main.student.ext;

import main.handler.txt.Student;
import org.apache.poi.hssf.usermodel.*;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

public class Excel{

    @SuppressWarnings({ "unchecked", "rawtypes" })
    private static List<Student> getStudent() throws Exception
    {
        List<Student> list = new ArrayList<Student>();

        BufferedReader br = new BufferedReader(new FileReader("main/handler/txt/student.txt"));
        String line;
        while((line = br.readLine())!=null){
            String[] str= line.split(",");
            Student student=new Student();
            //张三,212002072721,男,2002.7.27,100,90,80,270
            student.setName(str[0]);
            student.setSid(str[1]);
            student.setGender(str[2]);
            student.setBirth(str[3]);
            student.setMath(Integer.parseInt(str[4]));
            student.setJava(Integer.parseInt(str[5]));
            student.setPe(Integer.parseInt(str[6]));
            list.add(student);
        }
        br.close();
        return list;
    }

    @SuppressWarnings({ "deprecation", "rawtypes" })
    public static void main(String[] args) throws Exception//创建excel文件，并将list中的数据存入其中
    {
        // 第一步，创建一个webbook，对应一个Excel文件
        @SuppressWarnings("resource")
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("学生表一");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);
        cell = row.createCell((short) 1);
        cell.setCellValue("学号");
        cell.setCellStyle(style);
        cell = row.createCell((short) 2);
        cell.setCellValue("性别");
        cell.setCellStyle(style);
        cell = row.createCell((short) 3);
        cell.setCellValue("生日");
        cell.setCellStyle(style);
        cell = row.createCell((short) 4);
        cell.setCellValue("数学");
        cell.setCellStyle(style);
        cell = row.createCell((short) 5);
        cell.setCellValue("JAVA");
        cell.setCellStyle(style);
        cell = row.createCell((short) 6);
        cell.setCellValue("体育");
        cell.setCellStyle(style);

        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，  行和列都是从0开始
        List list = Excel.getStudent();

        for (int i = 0; i < list.size(); i++)
        {
            row = sheet.createRow((int) i + 1);
            Student stu = (Student) list.get(i);
            // 第四步，创建单元格，并设置值
            row.createCell((short) 0).setCellValue(stu.getName());
            row.createCell((short) 1).setCellValue( stu.getSid());
            row.createCell((short) 2).setCellValue( stu.getGender());
            row.createCell((short) 3).setCellValue( stu.getBirth());
            row.createCell((short) 4).setCellValue(stu.getMath());
            row.createCell((short) 5).setCellValue(stu.getJava());
            row.createCell((short) 6).setCellValue(stu.getPe());
        }
        // 第六步，将文件存到指定位置
        try
        {
            FileOutputStream fout = new FileOutputStream("D://students.xls");
            wb.write(fout);
            fout.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
