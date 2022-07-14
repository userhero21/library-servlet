package uz.jl.lessontwo.servlets.book;

import uz.jl.lessontwo.configs.ApplicationContextHolder;
import uz.jl.lessontwo.dao.book.BookDao;
import uz.jl.lessontwo.domain.Book;
import uz.jl.lessontwo.enums.Language;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet("/add")
//@MultipartConfig(
//        fileSizeThreshold = 1024 * 1024,     // 1 MB
//        maxFileSize = 1024 * 1024 * 10,      // 10 MB
//        maxRequestSize = 1024 * 1024 * 100   // 100 MB
//)
public class BookAddServlet extends HttpServlet {

    BookDao bookDao = ApplicationContextHolder.getBean(BookDao.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        Part coverPart = req.getPart("cover");
//        String cover = coverPart.getSubmittedFileName();
//        System.out.println("cover = " + cover);
//
//        Part filePart = req.getPart("file");
//        String file = filePart.getSubmittedFileName();
//        System.out.println("file = " + file);

        Book book = Book.builder()
                .name(req.getParameter("name"))
                .author(req.getParameter("author"))
                .genre(Enum.valueOf(Book.Genre.class, req.getParameter("genre").toUpperCase()))
                .description(req.getParameter("description"))
                .downloadCount(0)
                .language(Enum.valueOf(Language.class, req.getParameter("language")))
                .pageCount(Integer.parseInt(req.getParameter("pageCount")))
//                .status(BookStatus.ACTIVE)
                .build();
        bookDao.save(book);
        resp.sendRedirect("/");
    }
}
