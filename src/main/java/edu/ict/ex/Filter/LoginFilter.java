package edu.ict.ex.Filter;

import java.io.IOException;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.ict.ex.Mapper.UserMapper;
import edu.ict.ex.VO.CustomUserDetails;
import edu.ict.ex.VO.membersVO;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class LoginFilter extends UsernamePasswordAuthenticationFilter {

    private final AuthenticationManager authenticationManager;

    private final ObjectMapper objectMapper = new ObjectMapper();
    
    private final UserMapper userMapper;


    @Override
    public void setFilterProcessesUrl(String filterProcessesUrl) {
        super.setFilterProcessesUrl(filterProcessesUrl);
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) {
        try {
//            Map<String, String> requestMap = objectMapper.readValue(request.getInputStream(), Map.class);
            String id = request.getParameter("id");
            String passwd = request.getParameter("passwd");
            
            System.out.println(id);
            System.out.println(passwd);

            UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(id, passwd, null);
            return authenticationManager.authenticate(authToken);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    
    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication auth) throws IOException, ServletException {
        String id = ((CustomUserDetails) auth.getPrincipal()).getUsername();

        request.getSession().setAttribute("authSession", id);
        request.getSession().setMaxInactiveInterval(30 * 60);
        
        membersVO member = userMapper.findByAccount(id);
        
        System.out.println("관리자확인" + member.getManager_role());
        
        response.setContentType("application/json");
        response.getWriter().write("{\"status\": \"200\", \"username\": \"" + id + "\", \"isAdmin\": \"" + member.getManager_role() + "\"}");
        response.getWriter().flush();
        
        response.setStatus(HttpServletResponse.SC_OK);

    }

    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) throws IOException, ServletException {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);

    }


}
