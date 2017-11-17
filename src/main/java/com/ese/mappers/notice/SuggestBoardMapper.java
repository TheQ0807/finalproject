package com.ese.mappers.notice;

import java.util.List;

import com.ese.vo.notice.Suggest;

public interface SuggestBoardMapper {
	void addBoard(Suggest suggest);
	List<Suggest> getAllBoards();
	Suggest getBoardByNo(int boardNo);
	void updateBoard(Suggest suggest);
	int getSeq();
}
