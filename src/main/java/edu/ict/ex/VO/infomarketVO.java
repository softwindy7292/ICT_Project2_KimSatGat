package edu.ict.ex.VO;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class infomarketVO {
	   //변수와 변수 각각의 데이터 타입 표시
		private String market_code;
		private String market_name;
		private int market_type;
		private String market_address;
		private int area_code;
		private int mrk_open_type;
		private int open_1;
		private int open_2;
		private String ark_yn;
		private String elb_yn;
		private String cus_yn;
		private String spr_yn;
		private String fire_yn;
		private String child_yn;
		private String call_yn;
		private String hyu_yn;
		private String mo_yn;
		private String mulpum_yn;
		private String cycle_yn;
		private String play_yn;
		private String book_yn;
		private String cart_yn;
		private String frgn_yn;
		private String road_yn;
		private String broad_yn;
		private String culture_yn;
		private String cargo_yn;
		private String parking_yn;
		private String edu_yn;
		private String meeting_yn;
		private String heart_yn;
		private String toilet_yn;
		private float wido;
		private float gyungdo;
		private int shop_cnt;
		private String homepage;
		private int open_year;
		private String tel_no;
		private String area_name;
		private String open_type_name;
		private String mrk_open_date;
		private int st_area_code;
		private int end_area_code;
		private int st_mrk_open_type;
		private int end_mrk_open_type;

}
