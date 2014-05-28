package com.zcm.utils;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterFilter implements javax.servlet.Filter {

	public void doFilter(ServletRequest request, ServletResponse respnse,
			FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		respnse.setCharacterEncoding("UTF-8");
		chain.doFilter(request, respnse);
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}


}
