package com.kh.corporation.model.vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Corporation {
	private int corpNo;
	private String corpName;
	private String ceoName;
	private String corpBn;
	private String address;
	private int likeCount;
	private String homePage;
	private Logo logo;
}
