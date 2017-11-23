package com.ese.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.notice.DownloadNoticeMapper;
import com.ese.vo.notice.DownloadNotice;

@Service
public class DownloadNoticeServiceImpl implements DownloadNoticeService {
	
	@Autowired
	DownloadNoticeMapper downloadNoticeMapper;
	
	public List<DownloadNotice> getAllBoards() {
		
		return downloadNoticeMapper.getAllBoards();
	}
	public int getTotalRows() {
		
		return downloadNoticeMapper.getTotalRows();
	}
	public void addBoard(DownloadNotice downloadNotice) {
		downloadNoticeMapper.addBoard(downloadNotice);
	}
	
}
