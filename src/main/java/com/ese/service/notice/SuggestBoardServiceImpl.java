package com.ese.service.notice;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.notice.SuggestBoardMapper;
import com.ese.vo.notice.Suggest;

@Service
public class SuggestBoardServiceImpl implements SuggestBoardService {
	@Autowired
	SuggestBoardMapper suggestBoardMapper;
	
	public void addBoard(Suggest suggest) {
		int seq = suggestBoardMapper.getSeq();
		suggest.setNo(seq);
		suggest.setParentNo(seq);
		suggest.setCreatedate(new Date());
		
		suggestBoardMapper.addBoard(suggest);
	}
	public List<Suggest> getAllBoards() {
		return suggestBoardMapper.getAllBoards();
	}
	public Suggest getBoardByNo(int boardNo) {
		return suggestBoardMapper.getBoardByNo(boardNo);
	}
	public void updateBoard(Suggest suggest) {
		suggestBoardMapper.updateBoard(suggest);
	}
	
}
