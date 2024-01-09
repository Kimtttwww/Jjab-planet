package com.kh.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class JoayoCorp {
	private int joayoNo;
	private int corpNo;
	private int workerNo;
	private String corpName;
}