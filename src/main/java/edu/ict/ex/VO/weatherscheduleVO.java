package edu.ict.ex.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class weatherscheduleVO {
	private int sch_seq_no;
	private int pres_cnt;
	private Date start_date;
	private String start_hhmm;
	private String end_hhmm;
}
