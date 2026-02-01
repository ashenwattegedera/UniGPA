package com.unigpa.security;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

@WebFilter("/*")
public class LocaleFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(true);

        // Check if language parameter is passed
        String langParam = httpRequest.getParameter("lang");
        
        if (langParam != null && !langParam.isEmpty()) {
            // Validate language code
            if (langParam.equals("en") || langParam.equals("si")) {
                session.setAttribute("locale", new Locale(langParam));
                session.setAttribute("lang", langParam);
            }
        } else if (session.getAttribute("locale") == null) {
            // Set default locale to English if not already set
            session.setAttribute("locale", new Locale("en"));
            session.setAttribute("lang", "en");
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup if needed
    }
}
