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
//어떤 요청을 하였을 때, 아래 필터가 동작할 것인지
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
	//request: 사용자의 요청을 가로챔,  response: 다른 곳으로 응답을 보낼수도잇고 메세지를 출력할수도 있다.
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("필터 동작함");
		String name = request.getParameter("name");
		
		if(!name.equals("")) {
			//요청한 서비스를 실행해라
			chain.doFilter(request, response);
		}else {
			//메세지출력
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			//출력하기위해 스트림얻어옴
			PrintWriter out = response.getWriter();
			out.print("이름을 입력하지 않았습니다.");
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
