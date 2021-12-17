package com.sist.filter;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class LogFilter
 */
@WebFilter("/LogFilter")
public class LogFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LogFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		FileWriter fw = new FileWriter("c:/sist/log.txt", true);
		
		String cmd = ((HttpServletRequest)request).getRequestURI();
		java.util.Date today = new Date();
		int year = today.getYear()+1900;
		int month = today.getMonth()+1;
		int date = today.getDate();
		int hours = today.getHours();
		int minutes = today.getMinutes();
		int seconds = today.getSeconds();
		
		String ip = request.getRemoteAddr();
		String time = year + "/" + month + "/" + date + " "+ hours+ ":" + minutes + ":" + seconds;
		
	
		
		long start = System.currentTimeMillis();
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println("요청서비스명:" + cmd);
		System.out.println("요청시간:" + time);
		System.out.println("ip:" + ip);
		System.out.println("걸린시간:"+(end - start));
		System.out.println("--------------------------------------------------------------------");
		
		fw.write("요청서비스명:" + cmd + "\n");
		fw.write("요청시간:" + time + "\n");
		fw.write("ip:" + ip + "\n");
		fw.write("걸린시간:"+(end - start) + "\n");
		fw.write("--------------------------------------------------------------------"+ "\n");
		
		fw.close();
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
	