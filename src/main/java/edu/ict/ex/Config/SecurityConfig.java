package edu.ict.ex.Config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import edu.ict.ex.Filter.LoginFilter;
import edu.ict.ex.Filter.SessionFilter;
import edu.ict.ex.Mapper.UserMapper;
import edu.ict.ex.Service.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;


@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final AuthenticationConfiguration authenticationConfiguration;
    private final CustomUserDetailsService customUserDetailsService;
    private final UserMapper userMapper;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .csrf(AbstractHttpConfigurer::disable)
                //레스트풀 이용시 주석해제
//                .formLogin(AbstractHttpConfigurer::disable)
                .httpBasic(AbstractHttpConfigurer::disable);

        http
                .formLogin(form -> form
                        .loginPage("/signIn.html")
                        .defaultSuccessUrl("/main.html", true)
                        .failureUrl("/signIn.html")
                        .successHandler((request, response, authentication) -> {
                            response.sendRedirect("/main.html");
                        })
                        .loginProcessingUrl("/login")
                        .usernameParameter("id")
                        .passwordParameter("passwd")
                );


        http
                .logout(logout -> logout
                        .logoutSuccessUrl("/loginMain.html")
                        .invalidateHttpSession(true)
                        .clearAuthentication(true));

        http    .sessionManagement( (sessionManage) ->
                sessionManage.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED) );

        // 로그인 필터
        http
                .addFilterAt(new LoginFilter(authenticationManager(authenticationConfiguration), userMapper), UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(new SessionFilter(customUserDetailsService), UsernamePasswordAuthenticationFilter.class);


        // 인가 설정
        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/signIn.html", "/loginMain.html", "/signUp.html", "/js/*.js", "/image/*.jpg")
                        .permitAll()
                        .requestMatchers("/signUp/**").permitAll()
                        .anyRequest()
                        //.permitAll()
                        .authenticated()
                );


        return http.build();
    }
}

