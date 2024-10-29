package edu.ict.ex.JoinVO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class reviewboardTNameVO {
	private int review_id;
	private int star;
	private String name;
	private String content;
	private Date create_date;
	private String market_tour_code;
	
	// 관광지 이름 받아오기
	private String tour_name;
}
