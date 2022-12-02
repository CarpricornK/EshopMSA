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
public class ProductReplyReply {
	@Id //Primary key
	@GeneratedValue(strategy=GenerationType.IDENTITY)// 프로젝트에서 연결된 db의 넘버링 전략을 따라감
    private int id; //auto_increment
	
	@Column(nullable = false,length = 200)
	private String content;
	
	private String username;
	
	private int replyreplyid;
	
	@ManyToOne
	@JoinColumn(name="productboardid")
	private ProductBoard productboard;
	
	@CreationTimestamp
	private Timestamp createDate;
}
