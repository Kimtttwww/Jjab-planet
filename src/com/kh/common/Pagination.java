package com.kh.common;

import com.kh.common.model.vo.PageInfo;

public class Pagination {
	/**
	 * pageInfo 객체를 생성해주는 메서드
	 * @param objCount 모든 글의 갯수 
	 * @param currentPage 현재 요청한 페이지
	 * @param pageLimit 페이지바 하단에 보여질 페이징바의 페이지 최대 갯수
	 * @param objLimit 한 페이지에 보여질 글의 최대 갯수
	 * @return
	 */
	public static PageInfo getPageInfo(int objCount, int currentPage, int pageLimit, int objLimit) {
		int maxPage = (int)Math.ceil((double)objCount / objLimit);
		int startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		} 
		
		return new PageInfo(objCount, currentPage, pageLimit, objLimit, maxPage, startPage, endPage);
	}
}