package edu.ict.ex.VO;

import java.sql.Date;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class reviewboardVO {
	private int review_id;
	private int star;
	private String name;
	private String content;
	private Date create_date;
	private String market_tour_code;

	@Override
	public String toString() {
		return "reviewboardVO{" +
				"review_id=" + review_id +
				", star=" + star +
				", name='" + name + '\'' +
				", content='" + content + '\'' +
				", create_date=" + create_date +
				", market_tour_code='" + market_tour_code + '\'' +
				'}';
	}
}
