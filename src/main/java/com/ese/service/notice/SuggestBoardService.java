package com.ese.service.notice;

import java.util.List;

import com.ese.vo.notice.Suggest;

public interface SuggestBoardService {
	void addBoard(Suggest suggest);
	List<Suggest> getAllBoards();
	Suggest getBoardByNo(int boardNo);
	void updateBoard(Suggest suggest);
	
}
