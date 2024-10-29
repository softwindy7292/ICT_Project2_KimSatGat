package edu.ict.ex.VO;

public class TourVO {
    private String tour_code;
    private String tour_name;
    private String tour_address;
    private String tour_cmmt;
    private String tour_telno;
    private int custom_cnt;
    private int car_cnt;
    private int area_code;

    // Getters and Setters
    public String getTour_code() { return tour_code; }
    public void setTour_code(String tour_code) { this.tour_code = tour_code; }
    // ... (다른 필드에 대한 getter/setter)

    public int getArea_code() { return area_code; }
    public void setArea_code(int area_code) { this.area_code = area_code; }
	public String getTour_name() {
		return tour_name;
	}
	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}
	public String getTour_address() {
		return tour_address;
	}
	public void setTour_address(String tour_address) {
		this.tour_address = tour_address;
	}
	public String getTour_cmmt() {
		return tour_cmmt;
	}
	public void setTour_cmmt(String tour_cmmt) {
		this.tour_cmmt = tour_cmmt;
	}
	public String getTour_telno() {
		return tour_telno;
	}
	public void setTour_telno(String tour_telno) {
		this.tour_telno = tour_telno;
	}
	public int getCustom_cnt() {
		return custom_cnt;
	}
	public void setCustom_cnt(int custom_cnt) {
		this.custom_cnt = custom_cnt;
	}
	public int getCar_cnt() {
		return car_cnt;
	}
	public void setCar_cnt(int car_cnt) {
		this.car_cnt = car_cnt;
	}
}
