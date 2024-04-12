package File;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sample/jsp/mypage/download.do")
public class DownloadController extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession(true);
        String saveDirectory = "D:\\JAVA4\\PersonalProject\\PersonalProject\\src\\main\\webapp\\MessageFile";
        String saveFileName = request.getParameter("saveFile");
        String orgFileName = request.getParameter("orgFile");

        try{
            File file = new File(saveDirectory, saveFileName);
            InputStream inStream = new FileInputStream(file);
            String cilent = request.getHeader("User-Agent");
            if(cilent.indexOf("WOW64") == -1){
                orgFileName = new String(orgFileName.getBytes("UTF-8"), "ISO-8859-1");
                System.out.println(orgFileName);
            } else {
                orgFileName = new String(orgFileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            response.reset();
            response.setContentType("application/octect-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\""+ orgFileName + "\"");
            response.setHeader("Content-Length",""+file.length());



            OutputStream oStream = response.getOutputStream();
            byte b[] = new byte[(int)file.length()];
            int readBuffer = 0;
            while((readBuffer = inStream.read(b)) > 0){
                oStream.write(b,0,readBuffer);
            }
            inStream.close();
            oStream.close();
        }catch(FileNotFoundException e){
            System.out.println("파일을 찾지 못했습니다.");
        }
        catch(Exception e){
            System.out.println("파일 다운로드 오류");
            e.printStackTrace();
        }
    }
}