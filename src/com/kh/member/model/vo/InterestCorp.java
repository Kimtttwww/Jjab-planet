package com.kh.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class InterestCorp {

	private int joayoNo; //joayocorp, 관심설정번호
	private int corpNo; // joayocorp, 기업번호
	private String corpName;
	private int workerNo; // joayocorp, 구직자번호
	
}
