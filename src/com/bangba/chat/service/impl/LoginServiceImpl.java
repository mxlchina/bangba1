package com.bangba.chat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bangba.chat.mapper.LoginMapper;
import com.bangba.chat.pojo.Staff;
import com.bangba.chat.pojo.User;
import com.bangba.chat.service.LoginService;
import com.bangba.chat.util.email.EmailUtil;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout = 5)
@Service("loginservice")
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginMapper loginmapper;

	public String getpwdbyname(String name) {
		Staff s = loginmapper.getpwdbyname(name);
		if (s != null)
			return s.getPassword();
		else
			return null;
	}
	
	public String getPwdbynameAndEmail(String name,String email) {
		Staff s = loginmapper.getPwdbynameAndEmail(name,email);
		if (s != null)
			return s.getPassword();
		else
			return null;
	}

	public Long getUidbyname(String name) {
		Staff s = loginmapper.getpwdbyname(name);
		if (s != null)
			return (long) s.getStaffId();
		else
			return null;
	}

	public String getnamebyid(long id) {
		Staff s = loginmapper.getnamebyid(id);
		if (s != null)
			return s.getUsername();
		else
			return null;
	}
	
	public Staff getStaffbyid(long id) {
		Staff s = loginmapper.getnamebyid(id);
		return s;
	}

	@Override
	public Integer regist(Staff staff) {
		return loginmapper.regist(staff);
	}
	
	public boolean findPassword(String name,String email){
		boolean result = true ;
		String pwd = "";
		try{
			pwd = getPwdbynameAndEmail(name, email);
			if(pwd!=null&&!"".equals(pwd)){
				EmailUtil.sendMessage("", "mxlchina@163.com", "lizhifang1", "mxlchina@163.com", "密码找回", "您的密码是："+pwd, "text/html;charset=gb2312");
			}
		}catch( Exception e)
		{
			result = false;
		}
		return  result;
	}

	
}
