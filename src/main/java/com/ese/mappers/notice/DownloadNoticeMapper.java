package com.ese.mappers.notice;

import java.util.List;

import com.ese.vo.notice.DownloadNotice;

public interface DownloadNoticeMapper {
	List<DownloadNotice> getAllBoards();
	int getTotalRows();
	void addBoard(DownloadNotice downloadNotice);
	
}
