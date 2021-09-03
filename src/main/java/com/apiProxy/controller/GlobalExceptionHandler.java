package com.apiProxy.controller;

import com.apiProxy.exception.ServerException;
import com.apiProxy.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.ConstraintViolationException;

/**
 * @Author：hem
 * @Date：5/27/21 5:26 下午
 */
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 未处理的异常
     *
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(Exception.class)
    public Response handleException(Exception e) {
        log.error("未处理的异常", e);
        return Response.error(e.getMessage());
    }

    /**
     * 权限不足
     *
     * @return
     */
    @ResponseBody
    @ExceptionHandler(AccessDeniedException.class)
    public Response handleAccessDeniedException() {
        return Response.accessDenied();
    }

    /**
     * ServerException
     *
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(ServerException.class)
    public Response handleBusinessException(ServerException e) {
        return Response.fail(e.getMessage());
    }

    /**
     * 参数校验不通过
     *
     * @param e
     * @return
     */
    @ExceptionHandler(BindException.class)
    @ResponseBody
    public Response handleBindException(BindException e) {
        return Response.fail(e.getFieldError().getDefaultMessage());
    }

    /**
     * 参数校验不通过
     *
     * @param e
     * @return
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public Response handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        return Response.fail(e.getBindingResult().getFieldError().getDefaultMessage());
    }

    /**
     * 参数校验不通过
     * @param e
     * @return
     */
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseBody
    public Response handleConstraintViolationException(ConstraintViolationException e) {
        return Response.fail(e.getConstraintViolations().stream().findFirst().get().getMessage());
    }
}
