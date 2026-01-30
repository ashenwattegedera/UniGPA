package com.unigpa.security;

import com.unigpa.model.User;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Authentication Filter for UniGPA Application.
 * 
 * This filter intercepts all requests and enforces authentication for protected
 * routes.
 * It handles:
 * - Public route whitelisting (login, register, static resources)
 * - Session validation for protected routes
 * - Redirect to login for unauthenticated users
 * - Preserve original URL for post-login redirect
 * - Redirect authenticated users away from login/register pages
 */
@WebFilter(filterName = "AuthFilter", urlPatterns = "/*")
public class AuthFilter implements Filter {

    // Exact paths that don't require authentication
    private static final Set<String> PUBLIC_PATHS = new HashSet<>(Arrays.asList(
            "/",
            "/login",
            "/register",
            "/logout",
            "/index.jsp",
            "/login.jsp",
            "/register.jsp"));

    // Path prefixes for static resources (no auth required)
    private static final Set<String> PUBLIC_PREFIXES = new HashSet<>(Arrays.asList(
            "/css/",
            "/js/",
            "/images/",
            "/fonts/",
            "/assets/"));

    // File extensions that don't require authentication
    private static final Set<String> PUBLIC_EXTENSIONS = new HashSet<>(Arrays.asList(
            ".css", ".js", ".png", ".jpg", ".jpeg", ".gif", ".ico",
            ".woff", ".woff2", ".ttf", ".eot", ".svg", ".map"));

    // Paths that authenticated users should be redirected away from
    private static final Set<String> AUTH_REDIRECT_PATHS = new HashSet<>(Arrays.asList(
            "/login",
            "/register",
            "/login.jsp",
            "/register.jsp"));

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // No initialization required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String contextPath = httpRequest.getContextPath();
        String requestURI = httpRequest.getRequestURI();
        String path = requestURI.substring(contextPath.length());

        // Normalize empty path to "/"
        if (path.isEmpty()) {
            path = "/";
        }

        // Check if the path is public (doesn't require authentication)
        boolean isPublicPath = isPublicPath(path);

        // Get the current session (don't create a new one)
        HttpSession session = httpRequest.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        boolean isAuthenticated = (user != null);

        // Case 1: Authenticated user trying to access login/register pages
        // Redirect them to dashboard instead
        if (isAuthenticated && isAuthRedirectPath(path)) {
            httpResponse.sendRedirect(contextPath + "/dashboard");
            return;
        }

        // Case 2: Public path - allow access without authentication
        if (isPublicPath) {
            chain.doFilter(request, response);
            return;
        }

        // Case 3: Protected path with authenticated user - allow access
        if (isAuthenticated) {
            chain.doFilter(request, response);
            return;
        }

        // Case 4: Protected path without authentication - redirect to login
        // Save the original URL for post-login redirect
        String originalUrl = requestURI;
        String queryString = httpRequest.getQueryString();
        if (queryString != null && !queryString.isEmpty()) {
            originalUrl += "?" + queryString;
        }

        // Store the original URL in session for redirect after login
        HttpSession newSession = httpRequest.getSession(true);
        newSession.setAttribute("redirectAfterLogin", originalUrl);

        // Redirect to login page
        httpResponse.sendRedirect(contextPath + "/login");
    }

    /**
     * Check if a path is public (doesn't require authentication).
     * 
     * @param path The request path (without context path)
     * @return true if the path is public, false otherwise
     */
    private boolean isPublicPath(String path) {
        // Check exact path matches
        if (PUBLIC_PATHS.contains(path)) {
            return true;
        }

        // Check path prefixes (static resources directories)
        for (String prefix : PUBLIC_PREFIXES) {
            if (path.startsWith(prefix)) {
                return true;
            }
        }

        // Check file extensions (static resources)
        for (String extension : PUBLIC_EXTENSIONS) {
            if (path.toLowerCase().endsWith(extension)) {
                return true;
            }
        }

        return false;
    }

    /**
     * Check if an authenticated user should be redirected away from this path.
     * 
     * @param path The request path (without context path)
     * @return true if the user should be redirected to dashboard
     */
    private boolean isAuthRedirectPath(String path) {
        return AUTH_REDIRECT_PATHS.contains(path);
    }

    @Override
    public void destroy() {
        // No cleanup required
    }
}
