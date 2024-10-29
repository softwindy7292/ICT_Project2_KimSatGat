package edu.ict.ex.VO;

import java.sql.Date;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class areaweatherVO {
	private Date gijun_date;
	private int area_code;
	private int pres_cnt;
	private String pop;
	private String pty;
	private String reh;
	private String sno;
	private String sky;
	private String tmp;
	private String tmn;
	private String tmx;
	private String uuu;
	private String vvv;
	private String wav;
	private String vec;
	private String wsd;
}
