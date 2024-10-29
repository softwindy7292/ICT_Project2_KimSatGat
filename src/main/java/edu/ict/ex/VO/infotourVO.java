package edu.ict.ex.VO;

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
public class infotourVO {
	private String tour_code;
	private String tour_name;
	private String area_code;
	private String tour_address;
	private String tour_cmmt;
	private int tour_wido;
	private int tour_gyungdo;
	private int tour_area;
	private String comm_sisul;
	private String sukbak_sisul;
	private String play_sisul;
	private String culture_sisul;
	private String meeting_sisul;
	private String support_sisul;
	private String jijung_il;	
	private int custom_cnt;	
	private int car_cnt;	
	private String tour_telno;
	private String manager_nm;
	private String provider_nm;
}
