package com.myweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.service.IBoardService;
import com.myweb.board.service.RegisterServiceImpl;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	// .board로 끝나는 요청은 이 컨트롤러로 들어오도록 처리
	// 1. get,post 요청을 하나의 메서드에 연결 -> doAction()으로
	// 2. 컨텍스트 path를 제거 /board/list.board 요청으로 들어오면 board_list화면으로 이동
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//컨트롤러로 들어온 명령을 구분해서 처리하는 구간
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI(); //요청주소(http[s]://를 뺀 주소)
		String path = request.getContextPath(); //context 주소를 얻어옴
		String command = uri.substring(path.length()); // /board/list.board로 만드는 과정
		
		//인터페이스 객체선언
		IBoardService service = null;
		
		//command에 따른 동작 구현
		if(command.equals("/board/list.board")) {
			//게시글 목록을 가지고 화면으로 이동
			//forward로 결과값을 전달할 예정
			service = new GetListServiceImpl();
			service.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_list.jsp");
			dp.forward(request, response);
		} else if(command.equals("/board/write.board")) {
			//글작성 페이지(View)로 이동
			RequestDispatcher dp = request.getRequestDispatcher("board_write.jsp");
			dp.forward(request, response);
		} else if(command.equals("/board/register.board")) {
			//글등록 요청
			service = new RegisterServiceImpl();
			service.execute(request, response);
			
			response.sendRedirect("list.board");
		} else if(command.equals("/board/getContent.board")) {
			service = new GetContentServiceImpl();
			service.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_content.jsp");
			dp.forward(request, response);
		}
	}
}
