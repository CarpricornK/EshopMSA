package kopo.poly.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴
@Entity
public class FavoriteJim {
	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.AUTO) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int fid; // auto_increment

	private int fvalue; // 찜하기
	
	private String fname; // 찜하기이름
	
	private String ftitle; // 찜한제목
	
	
	private int id; // 찜하기



}
