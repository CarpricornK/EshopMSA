package kopo.poly.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class ProductReply {
	@Id //Primary key
	@GeneratedValue(strategy=GenerationType.IDENTITY)// 프로젝트에서 연결된 db의 넘버링 전략을 따라감
    private int id; //auto_increment
	
	@Column(nullable = true,length = 200)
	private String content;
	
	private String username;
	
	@ManyToOne
	@JoinColumn(name="productboardid")
	private ProductBoard productboard;

	private int kinds;
	
	private int score;
	
	private String starpoint1;

	
	@CreationTimestamp
	private Timestamp createDate;
}
