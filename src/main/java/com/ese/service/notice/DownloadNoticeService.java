package com.ese.service.notice;

import java.util.List;

import com.ese.vo.notice.DownloadNotice;

public interface DownloadNoticeService {

	List<DownloadNotice> getAllBoards();
	int getTotalRows();
	void addBoard(DownloadNotice downloadNotice);
	
}
