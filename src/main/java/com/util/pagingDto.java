package com.util;

import org.springframework.stereotype.Component;

@Component
public class pagingDto {
	//현재 페이지
	private int pageNum;
	//전체 row 갯 수
	private int totalCount;
	//한 화면에 보여줄 row 갯 수
	private int itemCount = 10;
	//한 화면에 보여줄 페이지 갯 수
	private int itemPageCount = 5;
	//출력 페이지 첫 번째 번호
	private int startPage;
	//출력 페이지 마지막 번호
	private int endPage;
	//총 페이지 수
	private int totalPage;
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public pagingDto() { }
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public int getItemPageCount() {
		return itemPageCount;
	}
	public void setItemPageCount(int itemPageCount) {
		this.itemPageCount = itemPageCount;
	}
	
	public void pagination() {
		endPage = ((int)Math.ceil(pageNum/(double)itemPageCount))*itemPageCount;
		startPage = endPage - (itemPageCount - 1);
		
		//총 페이지
		totalPage = (int)Math.ceil(totalCount/(double)itemCount);
		
		//총 페이지 보다 마지막 페이지가 더 큰 경우
		if(endPage>totalPage) {
			endPage=totalPage;
		}
		
	}

	@Override
	public String toString() {
		return "pagingDto [pageNum=" + pageNum + ", totalCount=" + totalCount + ", itemCount=" + itemCount
				+ ", itemPageCount=" + itemPageCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalPage=" + totalPage + "]";
	}	
	
}

