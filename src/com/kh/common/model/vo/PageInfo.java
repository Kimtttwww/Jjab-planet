package com.kh.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@Data
public class PageInfo {
	/** 글 갯수 */
	private int objCount;
	/** 현재 요청한 페이지 */
	private int currentPage;
	/** 페이지바 하단에 보여질 페이징바의 페이지 최대 갯수 */
	private int pageLimit;
	/** 한 페이지에 보여질 글의 최대 갯수 */
	private int objLimit;
	
	/** 가장 마지막 페이지가 몇번 페이지인지(총 페이지 수) */
	private int maxPage;
	/** 페이지 하단에 보여질 페이징바의 시작수 */
	private int startPage;
	/** 페이징 하단에 보여질 페이징바의 끝수 */
	private int endPage;
}
