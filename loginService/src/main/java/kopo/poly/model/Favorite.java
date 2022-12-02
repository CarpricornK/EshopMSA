package kopo.poly.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴
@Entity
public class Favorite {




	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int id; // auto_increment

	@Column(nullable = false, length = 100)
	private String title;

	private String username; // 아이디
	
	private String adminusername; // 어드민아이디
	
	private int price; // 가격
	
	private int discountpercentage; // 할인(백분율)
	
	private int fee; // 배송료
	
	private int ordercount; // 주문수량
	
	@Lob
	private String img1;

	@Lob // 대용량 데이터
	private String content;// 섬머노트 라이브러리 <html>태그가 섞여서 디자인됨
	
	@Lob
	private String info;// 상품 정보
	
	private String orderaddress;
	
	private String ordercontent;
	
	private String type;
	
	private int delivery;
	
	private int productido;
	



}
