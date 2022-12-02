package kopo.poly.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴
@Entity
public class ProductBoard {




	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int id; // auto_increment

	@Column(nullable = false, length = 100)
	private String title;

	private String username; // 아이디
	
	private String adminname; // 관리자아이디
	
	private int price; // 가격
	
	private int discount; // 할인
	
	private int discountpercentage; // 할인(백분율)
	
	private int fee; // 배송료
	
	private int mcount; // 재고수
	
	@Lob 
	private String img1; // 대표이미지
	
	@Lob 
	private String img2; // 추가사진
	
	@Lob 
	private String img3; // 추가사진
	
	@Lob 
	private String img4; // 추가사진

	@Lob // 대용량 데이터
	private String content;// 섬머노트 라이브러리 <html>태그가 섞여서 디자인됨
	
	@Lob
	private String info;// 상품 정보
	
	private String type1;//상품 분류(이어폰)
	
	private String type2;// 상품 분류2(무선,유선)\
	
	private int count; // 조회수

	
	// EAGER 안치면 자동으로 LAZY
	@OneToMany(mappedBy = "productboard", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE) // mappedBy 연관관계의 주인이 아니다 (난
																							// FK가 아니에요) DB에 칼럼을 만들지 마세요
	@JsonIgnoreProperties({ "productboard" })
	@OrderBy("id desc")
	private List<ProductReply> Productreplys;
	

	 
	
	@CreationTimestamp
	private Timestamp createDate;



}
