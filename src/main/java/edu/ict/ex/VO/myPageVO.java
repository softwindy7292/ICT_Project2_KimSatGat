package edu.ict.ex.VO;

import java.util.List;

import edu.ict.ex.JoinVO.reviewboardMNameVO;
import edu.ict.ex.JoinVO.reviewboardTNameVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class myPageVO {
	private membersVO members;
	private List<reviewboardMNameVO> reviewboardM;
	private List<reviewboardTNameVO> reviewboardT;
}
