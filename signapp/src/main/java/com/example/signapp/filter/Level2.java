package com.example.signapp.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.apache.ibatis.javassist.expr.Instanceof;

import com.example.signapp.dto.Employee;

/**
 * Servlet Filter implementation class Level2
 */
@WebFilter("/level2/*")
public class Level2 extends HttpFilter implements Filter {
       

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if(request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			HttpServletRequest	req	= (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			
			HttpSession session = req.getSession();
			Employee loginUser = (Employee) session.getAttribute("loginUser");
			
		       // ✅ 로그인 안 되어 있거나 정보가 불완전한 경우 → 로그인 페이지로
            if (loginUser == null || loginUser.getName() == null || loginUser.getLevel() == null) {
                res.sendRedirect("/login");
                return;
            }
			
			int level = loginUser.getLevel();
			
			if(level == 1) {
				res.sendRedirect("/level1/home");
				return;
			} else if( level == 2) {
				chain.doFilter(request, response); // level이 2일경우 조건 통과시킴
				return;
			} else if( level == 3) {
				res.sendRedirect("/level3/home");
				return;
			} else {
				res.sendRedirect("/login");
				return;
			}
			
		}
		
		
		chain.doFilter(request, response);
	}



}
