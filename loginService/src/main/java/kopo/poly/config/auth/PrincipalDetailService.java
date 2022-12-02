package kopo.poly.config.auth;

import kopo.poly.model.User;
import kopo.poly.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service // Bean 등록 (IoC)
public class PrincipalDetailService implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;

//  LoginForm에서 action="/loginProc" 되면
//  스프링 필터 체인이 낚아채서 loadUserByUsername함수를 호출한다.
//	로그인 요청이 오면 자동으로 PrincipalDetailsService 타입으로 IoC되어있는 loadUserByUsername 실행

//	Spring Security의 로그인 기능인 loadUserByUsername 함수는 Spring Security가 호출함
//	개발자는 loadUserByUsername 함수를 호출하기 위한 Controller에 함수를 만들지 않음

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User principal = userRepository.findByUsername(username)
				.orElseThrow(()->{
					return new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다. : "+username);
				});

		//유저 object를 리턴한다 리턴된값은 //Security Session => Authentication => UserDetails 의
		//Security Session => Authentication(내부 UserDetails)에 들어가고
		return new PrincipalDetail(principal);
	}

}