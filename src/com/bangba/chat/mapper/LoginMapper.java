package com.bangba.chat.mapper;

import com.bangba.chat.pojo.Staff;


public interface LoginMapper {
	Staff getPwdbynameAndEmail(String name,String email);
	Staff getpwdbyname(String name);
	Staff getnamebyid(long id);
	Integer regist(Staff staff);
}
