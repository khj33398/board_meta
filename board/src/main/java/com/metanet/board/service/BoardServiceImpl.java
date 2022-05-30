package com.metanet.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.metanet.board.dao.BoardDAO;
import com.metanet.board.dto.Board;
import com.metanet.board.dto.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public void writeBoard(Board board) throws Exception {
		Integer boardNum = boardDAO.selectMaxBoardNum();
		if(boardNum==null) boardNum = 1;
		else boardNum += 1;
		
		board.setBoard_num(boardNum);
		board.setBoard_re_ref(boardNum);
		board.setBoard_re_lev(0);
		board.setBoard_re_seq(0);
		board.setBoard_readcount(0);
		boardDAO.insertBoard(board);
	}

	@Override
	public List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception {
		int boardCount = boardDAO.selectBoardCount();
		//총 페이지 수
		int maxPage = (int)Math.ceil((double)boardCount/10);
		//현재 페이지에 보여줄 시작 페이지 버튼(1, 11, 21, ...)
		//int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int startPage = (page/10)*10 + 1;
		//현재 페이지에 보여줄 마지막 페이지 버튼(10, 20, 30, ...)
		int endPage = startPage+9;
		
		if(endPage > maxPage) endPage = maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setPage(page);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setListCount(boardCount);
		int startrow = (page-1)*10 + 1; //oracle은 1부터, mysql의 limit은 0부터
		
		return boardDAO.selectAllBoard(startrow);
	}

	@Override
	public Board getBoard(int boardNum) throws Exception {
		boardDAO.updateReadCount(boardNum);
		return boardDAO.selectBoard(boardNum);
	}

	@Override
	public void modifyBoard(Board board) throws Exception {
		String pass = boardDAO.selectPassword(board.getBoard_num());
		if(pass.equals(board.getBoard_pass())) {
			boardDAO.updateBoard(board);
		}else {
			throw new Exception("수정 권한 없음");
		}
		
	}

	@Override
	public void writeReply(Board board) throws Exception {
		//board_num으로 원글 조회
		Board src_board = boardDAO.selectBoard(board.getBoard_num());
		//글 번호 생성
		Integer boardNum = boardDAO.selectMaxBoardNum();
		board.setBoard_num(boardNum+1);
		//원글의 ref 번호로 답글의 ref 번호 할당
		board.setBoard_re_ref(src_board.getBoard_re_ref());
		//원글의 lev+1
		board.setBoard_re_lev(src_board.getBoard_re_lev()+1);
		//원글의 seq보다 큰 seq인 글들을 +1
		boardDAO.updateBoardReSeq(src_board);
		//원글의 seq+1을 seq로 할당
		board.setBoard_re_seq(src_board.getBoard_re_seq()+1);
		boardDAO.insertBoard(board);
	}

	@Override
	public void removeBoard(int boardNum, String boardPass) throws Exception {
		String password = boardDAO.selectPassword(boardNum);
		if(password.equals(boardPass)) {
			boardDAO.deleteBoard(boardNum);
		}else {
			throw new Exception("삭제 권한 없음");
		}
		
	}

}
