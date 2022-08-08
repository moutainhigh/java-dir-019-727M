package shop.yaojianfeng.study.jspServlet.class22.servlet.day20211112;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * 可以向页面上传输图片
 *
 * @author yaojianfeng
 */
@WebServlet("/showImage22")
public class ShowImage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置类型
        resp.setContentType("image/jpeg");
        //创建输出流对象
        ServletOutputStream out = resp.getOutputStream();
        //创建输入流对象
        FileInputStream fin = new FileInputStream("D:\\studyspace\\jspServlet\\src\\main\\webapp\\image\\edgOne.jpeg");
        //创建缓存流
        BufferedInputStream bin = new BufferedInputStream(fin);
        BufferedOutputStream bout = new BufferedOutputStream(out);

        //读取内存数据 然后向浏览器传送数据
        int ch = 0;
        while ((ch = bin.read()) != -1)
        {
            bout.write(ch);
        }
        bin.close();
        fin.close();
        bout.close();
        out.close();
    }

}

