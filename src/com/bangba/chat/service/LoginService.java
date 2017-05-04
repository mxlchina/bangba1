package com.bangba.chat.service;

import javax.annotation.Resource;

import com.bangba.chat.pojo.Staff;

@Resource(name = "loginservice")
public interface LoginService {
	String getpwdbyname(String name);
	String getPwdbynameAndEmail(String name,String email);
	Long getUidbyname(String name);
	String getnamebyid(long id);
	Integer regist(Staff staff);
    boolean findPassword(String name,String email);
    public Staff getStaffbyid(long id);
}
