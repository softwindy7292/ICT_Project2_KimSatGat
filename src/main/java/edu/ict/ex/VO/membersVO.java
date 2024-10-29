package edu.ict.ex.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class membersVO {
	private String id;
	private String passwd;
	private int	member_gubun;
	private String manager_role;
	private int	status;
	private String name;
	private String birthday;
	private String telno;
	private String email;
	private Date create_date;
	private String last_change_id;
	private Date last_change_date;
	private Date expire_date;

	@Override
	public String toString() {
		return "membersVO{" +
				"id='" + id + '\'' +
				", passwd='" + passwd + '\'' +
				", member_gubun=" + member_gubun +
				", manager_role='" + manager_role + '\'' +
				", status=" + status +
				", name='" + name + '\'' +
				", birthday='" + birthday + '\'' +
				", telno='" + telno + '\'' +
				", email='" + email + '\'' +
				", create_date=" + create_date +
				", last_change_id='" + last_change_id + '\'' +
				", last_change_date=" + last_change_date +
				", expire_date=" + expire_date +
				'}';
	}
}
