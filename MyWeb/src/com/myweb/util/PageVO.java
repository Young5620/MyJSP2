package com.myweb.util;

public class PageVO {
	
	//화면에 그려질 버튼들의 개수를 계산하는 클래스
	private int startPage; //시작번호
	private int endPage; //끝번호
	private int total; //전체 게시글 개수
	
	private int pageNum; // 현재 조회하는 페이지
	
	private boolean next; // 다음버튼 활성화 여부
	private boolean prev; // 이번버튼 활성화 여부
	
	private Criteria cri; // 페이지 기준
	
	//생성자를 기본 생성자를 생성하지 못하고, 
	//total과 기준값(Criteria)를 받아서 계산 처리하도록 선언
	
	public PageVO(int total, Criteria cri) {
		//전달되는 매개변수에서 초기값을 저장
		this.total = total;
		this.cri = cri;
		this.pageNum = cri.getPageNum();
		
		//끝페이지 계산
		//조회하는 페이지 번호가 1~10 => 10
		//조회하는 페이지 번호가 11~20 => 20
		this.endPage = (int)Math.ceil(cri.getPageNum()/(double)10) * 10;
		
		//시작페이지 계산
		//끝페이지 번호 - 한번에 보여질 페이지번호 +1
		this.startPage = endPage - 9; //한번에 보여질 페이지 번호 -> 하단 페이지 번호
		
		//페이지 번호가 적을 때 나타내는 진짜 끝번호
		//total은 전체 게시물...ex)117
		int realEnd = (int)Math.ceil(this.total/(double)5);
		
		//마지막페이지 세팅에서 보여줘야 할 번호
		if(this.endPage>realEnd) {
			this.endPage = realEnd;
			
		//prev버튼 활성화 여부
		//startPage=>1,11,21,31...
		//startPage가 1보다 크면 true
		this.prev = this.startPage > 1;
		
		//next버튼 활성화 여부
		this.next = this.endPage < realEnd;
		
		//확인
		System.out.println("시작페이지 : " + this.startPage + ", 끝페이지 : " + this.endPage);
		
		}
	}

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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
}
