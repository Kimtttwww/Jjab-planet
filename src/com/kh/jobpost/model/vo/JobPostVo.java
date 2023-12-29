package com.kh.jobpost.model.vo;

import java.sql.Date;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class JobPostVo {

	// JopPost
	private int jobPostNo; // 채용공고 ID
    private int corpNo; // 기업 ID
    private String postTitle; // 공고 제목
    private String postContent; // 공고 내용
    private Date endDate; // 마감일

    
    // Corporation
    private String corpName; // 기업명
    
    //Occupation
    private int jobNo; // 직종번호 
    //private String category;

    
    //생성자 ,getter, setter 생략
}
