package com.kh.propose.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Propose {
	private int proposeNo;
	/** 제안자 번호 */
	private int proposer;
	/** 제안받은 사용자 번호 */
	private int recepter;
	/** P : 포지션 제안, J : 채용공고 지원) */
	private String proposeType;
	private String proposerId;
	private String userId;
}