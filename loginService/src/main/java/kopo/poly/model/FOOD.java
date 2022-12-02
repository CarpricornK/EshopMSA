package kopo.poly.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;

//@Data
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder // 빌더 패턴
//@Document(collection = "KamisDTO")

@Data
@Entity
public class FOOD {

    @Id // Primary key
    private int FOOD_ID; // auto_increment

    private String FOOD_NM;

    @Lob // 대용량 데이터
    private String FOOD_CONTENT;

    @Lob // 대용량 데이터
    private String FOOD_DRUG;

    private String FOOD_TOXIC;

    @Lob // 대용량 데이터
    private String FOOD_PT;

    @Lob // 대용량 데이터
    private String FOOD_CONTENT2;


}

