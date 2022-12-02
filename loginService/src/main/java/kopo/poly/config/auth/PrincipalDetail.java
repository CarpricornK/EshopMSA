package kopo.poly.config.auth;

import kopo.poly.model.User;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
//52강 9:00
//principal (접근 주체) = 세션처럼 사용 = Spring Security Context 에 보관됨
//
//시큐리티가 /login 주소 요청이 오면 낚아채서 로그인을 진행
//로그인 진행 완료가 되면 시큐리티 session을 만들어줌 (security ContextHolder)
//오브젝트 타입 => Authentication 타입 객체
//Authentication 안에 user 정 보가 있어야 됨
//User 오브젝트타입 => UserDetails 타입 객체
//
//Security Session => Authentication => UserDetails
//세션에있는 정보를 get해서 꺼내면 Authentication객체가 나오고 이안에서 UserDetails를 꺼내면 object 접근 가능

@Data
public class PrincipalDetail implements UserDetails, OAuth2User{

	private static final long serialVersionUID = 7645618956884452156L;
	
	public PrincipalDetail(User user) {
		this.user = user;
	}
	
	
	private User user; //콤포지션
	private Map<String, Object> attributes;
	
	
	
	
	public PrincipalDetail(User user, Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
	}

	public User getUser() {
		return user;
		
	}

	public void setUser(User user) {
		this.user = user;
	}
	

	// 계정의 비밀번호를 리턴한다.
	@Override
	public String getPassword() {
		return user.getUSER_PASSWORD();
	}

	// 계정의 이름을 리턴한다.
	@Override
	public String getUsername() {
		return user.getUsername();
	}

	// 계정이 만료되지 않았는 지 리턴한다. (true: 만료안됨)
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	// 계정이 잠겨있지 않았는 지 리턴한다. (true: 잠기지 않음)
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	// 비밀번호가 만료되지 않았는 지 리턴한다. (true: 만료안됨)
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	// 계정이 활성화(사용가능)인 지 리턴한다. (true: 활성화)
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	// 계정이 갖고있는 권한 목록을 리턴한다. (권한이 여러개 있을 수 있어서 루프를 돌아야 하는데 우리는 한개만)
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<SimpleGrantedAuthority> collectors = new ArrayList<>();
		collectors.add(new SimpleGrantedAuthority("ROLE_"+user.getUSER_ROLE()));
				
		return collectors;
	}
	
	
	
	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}
	
	@Override
	public String getName() {
		return null;
	}
	
}