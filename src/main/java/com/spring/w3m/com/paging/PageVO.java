package com.spring.w3m.com.paging;

public class PageVO {
	
	private int startPage; //시작페이지
	private int endPage; //마지막페이지
	private boolean prev, next; //이전,다음
	
	private int total;
	private Criteria cri;
	
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getTotal() {
		return total;
	}
	public Criteria getCri() {
		return cri;
	}
	
	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
	
	public PageVO(Criteria cri, int total) {
		
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount())); //끝 번호보다 큰 경우에만 존재.
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
	}
	
	
	
}
