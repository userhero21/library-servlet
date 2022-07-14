package uz.jl.lessontwo.servlets;

import uz.jl.lessontwo.configs.ApplicationContextHolder;
import uz.jl.lessontwo.dao.book.BookDao;
import uz.jl.lessontwo.domain.Book;
import uz.jl.lessontwo.enums.Language;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import java.util.List;
import java.util.Objects;

@WebServlet("/")
public class HomeServlet extends HttpServlet {
    private List<Book> books;

    @Override
    public void init() throws ServletException {

//        books = List.of(
//                new Book(1, "Otgan kunlar", "Abdulla Qodiriy"),
//                new Book(2, "Rich Dad, Rich Mam", "Robert Kiyosaki")
//        );

    }

    BookDao bookDao = ApplicationContextHolder.getBean(BookDao.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // test
        session.setAttribute("auth_session", "1");
        String authSession = (String) session.getAttribute("auth_session");


        if (Objects.nonNull(authSession)) {
            req.setAttribute("username", req.getSession().getAttribute("auth_session"));

            books = bookDao.getAll();

            req.setAttribute("books", books);
            req.setAttribute("genres", Book.Genre.values());
            req.setAttribute("languages", Language.values());

            RequestDispatcher dispatcher = req.getRequestDispatcher("views/main.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect("/login");
        }
    }
}