package com.myweb.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;
import com.myweb.util.Criteria;
import com.myweb.util.PageVO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//페이징 작업
		//기준값 객체 생성
		Criteria cri = new Criteria();
		if(request.getParameter("pageNum") !=null) {
			//전달받은 페이지값을 처리
			String pageNum = request.getParameter("pageNum");
			
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		
		/*
		 1. DAO객체 생성
		 2. 목록조회 결과를 List형태로 받음
		 3. 다음으로 전달하기 위해서 request 객체에 강제로 저장
		 */
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> list = dao.getList(cri);
		
		request.setAttribute("list", list);
		
		//화면에 보여질 페이지 버튼을 계산처리
		//1. 총 게시글 수를 구한다.
		int total = dao.getTotal();
		//2. PageVO 객체를 생성
		PageVO vo = new PageVO(total, cri);
		
		request.setAttribute("PageVO", vo);
	}

}
