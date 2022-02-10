package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class ContentServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String num = request.getParameter("num");
		System.out.println("글번호 : "+num);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//쿠키생성 : 서버에 요청시 자동으로 request에 담겨서 전달됨
		Cookie[] arr = request.getCookies(); //생성된 쿠키값을 얻기
		
		//쿠키 검사
		boolean bool = true;
		for(Cookie c : arr) {
			if(c.getName().equals("hitNum"+num)) {//쿠키이름 게시글번호의 쿠키인지 확인
				bool = false;
				break;
			}
		}

		//조회수 업데이트
		if(bool) {
			//클릭한 적이 없다. 조회수를 하나 올려준다.
			dao.upHit(num);
		}
		
		BoardVO vo = dao.getContent(num);
		
		//중복 증가를 방지하기 위한 쿠키생성
		Cookie cookie = new Cookie("hitNum"+num, num);
		cookie.setMaxAge(30);
		response.addCookie(cookie);
		
		request.setAttribute("vo", vo); //request에 강제저장
	}

}
