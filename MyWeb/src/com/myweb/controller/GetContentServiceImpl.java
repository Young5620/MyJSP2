package com.myweb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;
import com.myweb.board.service.IBoardService;

public class GetContentServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.getContent(num);
		
		request.setAttribute("vo", vo);
	}

}
