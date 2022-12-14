package kopo.poly.config.ouath;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kopo.poly.config.auth.PrincipalDetail;
import kopo.poly.config.ouath.provider.GoogleUserInfo;
import kopo.poly.config.ouath.provider.NaverUserInfo2;
import kopo.poly.config.ouath.provider.OAuth2UserInfo;
import kopo.poly.controller.UserController;
import kopo.poly.model.User;
import kopo.poly.repository.UserRepository;
import kopo.poly.service.UserService;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private UserService userService;

	@Value("${cos.key}")
	private String cosKey;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("getClientRegistration==" + userRequest.getClientRegistration());
		System.out.println("getAccessToken==" + userRequest.getAccessToken().getTokenValue());

		OAuth2User oauth2User = super.loadUser(userRequest);
		

		System.out.println("getAttributes==" + oauth2User.getAttributes());
		System.out.println("responsesid==" + oauth2User.getAttributes().get("id"));
		System.out.println("responses==" + oauth2User.getAttributes().get("response"));

		
		 OAuth2UserInfo oAuth2UserInfo = null;
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("?????? ????????? ???????????????");
			oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
		} else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
			System.out.println("????????? ????????? ???????????????");
			oAuth2UserInfo = new NaverUserInfo2((Map)oauth2User.getAttributes().get("response"));
		} else {
			System.out.println("??????,????????????,???????????? ???????????????.");
		}
		
		
        String username1 = oAuth2UserInfo.getName();
        String email1 = oAuth2UserInfo.getEmail();
        String oauthType = oAuth2UserInfo.getouath();
        String role = "USER";

		User loadUser = User.builder()
				.username(username1)
				.USER_PASSWORD(cosKey)
				.USER_EMAIL(email1)
				.USER_OAUTH(oauthType)
				.build();


		User originUser = userService.findUser(loadUser.getUsername());
		if (originUser.getUsername() == null) {
			System.out.println("?????? ????????? ???????????? ?????? ??????????????? ???????????????.");
			userService.UserReg(loadUser);
			/* UserService??? ??????????????? username, password, email ????????? */

		}

		System.out.println("?????? ???????????? ???????????????");
		// ????????? ??????
		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(loadUser.getUsername(), cosKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return new PrincipalDetail(loadUser, oauth2User.getAttributes());
	}

	@GetMapping("/user/updateForma")
	public @ResponseBody String user(@AuthenticationPrincipal PrincipalDetail principalDetails) {
		System.out.println("principalDetails : " + principalDetails.getName());
		return "user";
	}

}
