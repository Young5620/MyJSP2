package com.myweb.util;

public class Criteria {
	// mysql,mariadb : select * from board order by desc limit 0,10;
	/* oracle : select *
	from (select rownum seq,num,writer,title 
	        from board where rownum <=? order by seq asc)
	where seq>=?
	;
	*/
	private int pageNum; //페이지 번호
	private int count; //몇개의 데이터를 보여줄건가
	
	public Criteria() {
		// 최초 게시판에 진입할 때 기본값 1번 페이지, 10개 데이터
		this.pageNum = 1;
		this.count = 5;
	}

	public Criteria(int pageNum, int count) {
		// 전달받은 매개변수를 이용한 페이지 값 출력
		super();
		this.pageNum = pageNum;
		this.count = count;
	}
	
	//mysql,mariadb limit x, count 구문의 x값을 구하는 메서드
	public int getPageStart() {
		//return ((pageNum-1) * count); -> mysql을 사용할 경우
		return (pageNum-1)*count +1; // oracle을 사용할 경우 rownum이 1부터 시작하기 때문에
	}
	
	//getter, setter 생성
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCount() {
		return count;
	}
	
	public int getCount_oracle() { // 위 쿼리에 따라서는 첫번째 물음표의 값이 증가하기 때문에
		return (pageNum*count);
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	
}
