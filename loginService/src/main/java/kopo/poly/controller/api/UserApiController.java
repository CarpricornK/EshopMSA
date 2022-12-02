package kopo.poly.controller.api;

import kopo.poly.dto.ResponseDto;
import kopo.poly.config.auth.PrincipalDetail;
import kopo.poly.model.User;
import kopo.poly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private AuthenticationManager authenticationManager;

	/*
	 * @Autowired private HttpSession session;
	 */

	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user) { // username,password,email
//		System.out.println("UserApiController : save 호출됨");
		// 실제로 DB에 insert를 하고 아래에서 return이 되면 됨
		userService.UserReg(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

//  @AuthenticationPrincipal를 통해 Spring Security로 로그인한 사용자 정보 가져옴 @@@@@@@@@@
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody User user, @AuthenticationPrincipal PrincipalDetail principal,
			HttpSession session) { /* @RequestBody json 받고싶으면 이거적으면됨 */
		userService.Userupdate(user);

		// 세션 등록
		String encPassword = encoder.encode(user.getUSER_PASSWORD());
		
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getUSER_PASSWORD()));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/auth/user")
	public ResponseDto<Integer> emailcheck(@RequestBody User user, @AuthenticationPrincipal PrincipalDetail principal,
									   HttpSession session) { /* @RequestBody json 받고싶으면 이거적으면됨 */
		userService.EmailCheck(user);

		// 세션 등록

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}


	@PutMapping("/auth/PW_FIND")
	public ResponseDto<Integer> PW_FIND(@RequestBody User user, @AuthenticationPrincipal PrincipalDetail principal,
										HttpSession session, String username) { /* @RequestBody json 받고싶으면 이거적으면됨 */

		userService.Emailsend(user);

		// 세션 등록
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}




	@PutMapping("/auth/PW_FIND2")
	public ResponseDto<Integer> PW_FIND2(@RequestBody User user, @AuthenticationPrincipal PrincipalDetail principal,
									   HttpSession session) { /* @RequestBody json 받고싶으면 이거적으면됨 */
		userService.Userupdate2(user);
		// 세션 등록
		String encPassword = encoder.encode(user.getUSER_PASSWORD());

		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getUSER_PASSWORD()));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}


	@PostMapping("/user/updateForm")
	public ResponseDto<Integer> Mail(@RequestBody User user) { // username,password,email
//		System.out.println("UserApiController : save 호출됨");
		// 실제로 DB에 insert를 하고 아래에서 return이 되면 됨
		userService.ReEmailsend(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}



	@DeleteMapping("/user/userdelete/{userid}")
	public ResponseDto<Integer> userdelete(@PathVariable int userid){
		userService.UserDelete(userid);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

}

/*
 * Authentication authentication = new
 * UsernamePasswordAuthenticationToken(principal, null,
 * principal.getAuthorities()); SecurityContext securityContext =
 * SecurityContextHolder.getContext();
 * securityContext.setAuthentication(authentication);
 * session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
 */