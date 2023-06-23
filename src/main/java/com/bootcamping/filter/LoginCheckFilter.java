package com.bootcamping.filter;

import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;

@Log4j2
@RequiredArgsConstructor
@WebFilter(urlPatterns = {"/*"})
public class LoginCheckFilter implements Filter {

    private final MemberService memberService;
    private boolean autoLoginChecked = false;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession();

        // 자동 로그인 체크를 한 번만 수행
        if (!autoLoginChecked) {
            log.info("Login check filter....");

            log.info("세션에서 멤버 확인 전");

            if (session.getAttribute("member") != null) {
                chain.doFilter(req, resp);
                return;
            }

            log.info("쿠키 찾기 전");

            Cookie cookie = findCookie(request.getCookies(), "rememberme");

            log.info("cookies: " + cookie);

            if (cookie == null) {
                autoLoginChecked = true;
                response.sendRedirect("/");
                return;
            }

            log.info("쿠키는 존재하지 않음");

            String uuid = cookie.getValue();

            try {
                MemberDTO memberDTO = memberService.getByUUID(uuid);

                log.info("쿠키의 값으로 조회한 사용자 정보: " + memberDTO);
                if (memberDTO == null) {
                    throw new Exception("cookie value is not valid");
                }
                session.setAttribute("member", memberDTO);

                chain.doFilter(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                ((HttpServletResponse) resp).sendRedirect("/member/login");
            }
        } else {
            // 이미 자동 로그인 체크를 수행한 경우, 다음 필터로 요청을 전달합니다.
            chain.doFilter(req, resp);
        }
    }

    @Override
    public void destroy() {

    }

    private Cookie findCookie(Cookie[] cookies, String name) {
        if (cookies == null || cookies.length == 0) {
            return null;
        }

        Optional<Cookie> result = Arrays.stream(cookies)
                .filter(ck -> ck.getName().equals(name))
                .findFirst();
        return result.isPresent() ? result.get() : null;
    }
}
