package com.sist.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class InputFilter
 */
//� ��û�� �Ͽ��� ��, �Ʒ� ���Ͱ� ������ ������
//@WebFilter("/inputOK.jsp")
public class InputFilter implements Filter {

    /**
     * Default constructor. 
     */
    public InputFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	//request: ������� ��û�� ����è,  response: �ٸ� ������ ������ ���������հ� �޼����� ����Ҽ��� �ִ�.
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("���� ������");
		String name = request.getParameter("name");
		
		if(!name.equals("")) {
			//��û�� ���񽺸� �����ض�
			chain.doFilter(request, response);
		}else {
			//�޼������
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			//����ϱ����� ��Ʈ������
			PrintWriter out = response.getWriter();
			out.print("�̸��� �Է����� �ʾҽ��ϴ�.");
			return;
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
