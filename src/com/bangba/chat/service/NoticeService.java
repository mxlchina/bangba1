package com.bangba.chat.service;

import javax.annotation.Resource;

import com.bangba.chat.pojo.Notice;

@Resource(name = "noticeService")
public interface NoticeService {
	Notice find();
}
