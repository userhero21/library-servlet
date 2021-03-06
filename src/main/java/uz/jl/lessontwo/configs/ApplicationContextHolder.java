package uz.jl.lessontwo.configs;

import uz.jl.lessontwo.dao.book.BookDao;
import uz.jl.lessontwo.dao.Dao;
import uz.jl.lessontwo.dao.user.UserDao;

public class ApplicationContextHolder {
    public static <T> T getBean(Class<? extends Dao> clazz) {
        return switch (clazz.getSimpleName()) {
            case "UserDao" -> (T) UserDao.getInstance();
            case "BookDao" -> (T) BookDao.getInstance();
            default -> throw new BeanNotFoundException("Bean not found");
        };
    }

    public static class BeanNotFoundException extends RuntimeException {
        public BeanNotFoundException(String message) {
            super(message);
        }
    }
}

