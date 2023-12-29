package com.kh.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageInfo {
	private int listCount;	// 게시글 갯수
	private int currentPage;	// 현재 요청한 페이지
	private int pageLimit;	// 페이지바 하단에 보여질 페이징바의 페이지 최대 갯수
	private int boardLimit;	// 한 페이지에 보여질 게시글의 최대 갯수
	
	private int maxPage;	// 가장 마지막 페이지가 몇번 페이지인지(총 페이지 수)
	private int startPage;	// 페이지 하단에 보여질 페이징바의 시작수
	private int endPage;	// 페이징 하단에 보여질 페이징바의 끝수
}
