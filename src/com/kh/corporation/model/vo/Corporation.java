package com.kh.corporation.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Corporation {
	

		private int corpNo;
		private String corpName;
		private String ceoName;
		private String corpBn;
		private String address;
		private int likeCount;
		private String homepage;
		
	
	
	
	
}
