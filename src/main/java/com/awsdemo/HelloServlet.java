package com.awsdemo;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;


public class HelloServlet extends HttpServlet {
    private static final long SEED = 1234567;
    private static Random s_random = new Random(SEED);

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res)
        throws IOException {
        PrintWriter out = res.getWriter();
        Cookie cookie = new Cookie("name", "test");
        res.addCookie(cookie);

        out.println("Hello AWS3");
        out.close();
    }
}
