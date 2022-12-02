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
public class Board {

	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int id; // auto_increment

	@Column(nullable = false, length = 100)
	private String title;

	private String username; // 아이디
	
	private String type; // 아이디

	@Lob // 대용량 데이터
	private String content;// 섬머노트 라이브러리 <html>태그가 섞여서 디자인됨

	private int count; // 조회수

	// EAGER 안치면 자동으로 LAZY
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE) // mappedBy 연관관계의 주인이 아니다 (난
																							// FK가 아니에요) DB에 칼럼을 만들지 마세요
	@JsonIgnoreProperties({ "board" })
	@OrderBy("id desc")
	private List<Reply> replys;

	@CreationTimestamp
	private Timestamp createDate;

}
