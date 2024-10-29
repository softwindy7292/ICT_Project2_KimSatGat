package edu.ict.ex.VO;

import java.sql.Date;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class noticeboardVO {
	private int notice_id;
	private String name;
	private String title;
	private String content;
	private Date create_date;
	private int hit;
}
