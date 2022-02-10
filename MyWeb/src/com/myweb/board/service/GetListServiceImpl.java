package com.myweb.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
		 1. DAO객체 생성
		 2. 목록조회 결과를 List형태로 받음
		 3. 다음으로 전달하기 위해서 request 객체에 강제로 저장
		 */
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> list = dao.getList();
		
		request.setAttribute("list", list);
	}

}
