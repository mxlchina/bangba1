package com.bangba.chat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bangba.chat.mapper.LoginMapper;
import com.bangba.chat.mapper.NoticeMapper;
import com.bangba.chat.pojo.Notice;
import com.bangba.chat.service.NoticeService;
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout = 5)
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeMapper noticeMapper;
	@Override
	public Notice find() {
		Notice notice =noticeMapper.find();
		return notice;
	}

}
