package ptithcm.controller;

import org.hibernate.HibernateException;
import org.hibernate.exception.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(value = Exception.class)
    public ResponseEntity<Object> handleException(Exception e) {
        logger.error("Unhandled exception: ", e);
        return new ResponseEntity<>("Internal server error",
                HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(value = HibernateException.class)
    public ResponseEntity<Object> handleHibernateException(HibernateException e) {
        logger.error("Hibernate exception: ", e);
        return new ResponseEntity<>("Database error",
                HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(value = ConstraintViolationException.class)
    public ResponseEntity<Object> handleConstraintViolationException(ConstraintViolationException e) {
        logger.error("Hibernate constraint violation exception: ", e);
        return new ResponseEntity<>("A database constraint has been violated",
                HttpStatus.BAD_REQUEST);
    }
}
