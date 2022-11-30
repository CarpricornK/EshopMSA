package kopo.poly.config;

import kopo.poly.handler.AccessDeniedHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.SecurityWebFiltersOrder;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.context.NoOpServerSecurityContextRepository;

@Slf4j
@Configuration
@RequiredArgsConstructor
@EnableWebFluxSecurity
public class SecurityConfig {

    // Access Denied 처리
    private final AccessDeniedHandler accessDeniedHandler;



    // 3. 필터링

    @Bean
    public SecurityWebFilterChain filterChain(ServerHttpSecurity http) throws Exception {

        log.info(this.getClass().getName() + ".filterChain Start!");

        // POST 방식 전송을 위해 csrf 막기
        http.csrf().disable();

        // 인증정보가 없다면(로그인하지 않지 않음) 로그인 화면 이동
        http.formLogin().loginPage("/auth/loginForm");

        // stateless방식의 애플리케이션이 되도록 설정
        http.securityContextRepository(NoOpServerSecurityContextRepository.getInstance());

        http.authorizeExchange(authz -> authz // 페이지 접속 권한 설정
                        // USER 권한
                        .pathMatchers("/notice/**").permitAll()

                        .pathMatchers("/productboard/**").permitAll()

                        .pathMatchers("/auth/**").permitAll()

                        .pathMatchers("/jwt/**").permitAll()

                        .pathMatchers("/chat/**").permitAll()

                        .pathMatchers("/index").permitAll()

                        .pathMatchers("/index2").permitAll()
//                        .anyExchange().authenticated() // 그외 나머지 url 요청은 인증된 사용자만 가능
                        .anyExchange().permitAll() // 그 외 나머지 url 요청은 인증 받지 않아도 접속 가능함
        );


        log.info(this.getClass().getName() + ".filterChain End!");

        return http.build();
    }
}

