package kopo.poly.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import reactor.core.publisher.Mono;

@Slf4j
@Configuration
public class RoutConfig {

    /**
     * Gateway로 접근되는 모든 요청에 대해 필터 처리
     * Order은 필더의 순서이며, 순서에 따라 실행 순서가 결정됨
     */


    /**
     * Gateway로 접근되는 모든 요청에 대해 URL 요청 분리하기
     */
    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
        return builder.routes()
                .route(r -> r.path("/productfavorite") // 찜목록
                        // 라우터 등록
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("notice-request", "From API Gateway!!")
                                        .addResponseHeader("notice-response", "From API Gateway!!")

                        )
                        .uri("http://localhost:8000") // 연결될 서버 주소

                ).route(r -> r.path("/auth/**") // 유저 서비스
                        // 라우터 등록
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("user-request", "From API Gateway!!")
                                        .addResponseHeader("user-response", "From API Gateway!!")
                        )
                        .uri("http://localhost:8000") // 연결될 서버 주소

                ).route(r -> r.path("/logout") // 회원정보 확인
                        // 라우터 등록
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("user-request", "From API Gateway!!")
                                        .addResponseHeader("user-response", "From API Gateway!!")
                        )
                        .uri("http://localhost:8000") // 연결될 서버 주소

                ).route(r -> r.path("/user/**") // 회원정보 확인
                        // 라우터 등록
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("user-request", "From API Gateway!!")
                                        .addResponseHeader("user-response", "From API Gateway!!")
                        )
                        .uri("http://localhost:8000") // 연결될 서버 주소

                ).route(r -> r.path("/") // 메인페이지
                        //라우터 등록 = > JWT 토큰 발급 및 로그인 처리 수행하는 서비스
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("jwt-request", "From API Gateway!!")
                                        .addResponseHeader("jwt-response", "From API Gateway!!")
                        )
                        .uri("http://localhost:8000") // 연결될 서버 주소
                ).route(r -> r.path("/chat/**") // 채팅 서비스
                        //라우터 등록 = > JWT 토큰 발급 및 로그인 처리 수행하는 서비스
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("jwt-request", "From API Gateway!!")
                                        .addResponseHeader("jwt-response", "From API Gateway!!")
                        )
                        .uri("http://localhost:11000") // 연결될 서버 주소
                ).route(r -> r.path("/productboard/**") // 제품 페이지
                        //라우터 등록 = > JWT 토큰 발급 및 로그인 처리 수행하는 서비스
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("jwt-request", "From API Gateway!!")
                                        .addResponseHeader("jwt-response", "From API Gateway!!")
                        )
                        .uri("http://localhost:8000") // 연결될 서버 주소
                ).route(r -> r.path("/board/**") // 글쓰기, **
                        //라우터 등록 = > JWT 토큰 발급 및 로그인 처리 수행하는 서비스
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("jwt-request", "From API Gateway!!")
                                        .addResponseHeader("jwt-response", "From API Gateway!!")
                        )
                        .uri("http://localhost:8000") // 연결될 서버 주소
                ).route(r -> r.path("/api/**") // apiController
                        //라우터 등록 = > JWT 토큰 발급 및 로그인 처리 수행하는 서비스
                        .filters(
                                // URL별 독립적으로 저장 항목을 추가할 경우 정의함
                                f -> f.addRequestHeader("jwt-request", "From API Gateway!!")
                                        .addResponseHeader("jwt-response", "From API Gateway!!")
                        )
                        .uri("http://localhost:8000") // 연결될 서버 주소
                )
                .build();
    }
}

