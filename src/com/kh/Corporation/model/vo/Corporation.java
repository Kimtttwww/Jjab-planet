package com.kh.Corporation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class Corporation {
	

		int corpNo;
		String corpName;
		String ceoName;
		String corpBn;
		String address;
		int likeCount;
		String homepage;
		
}