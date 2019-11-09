package com.kh.styleblending.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.admin.model.dao.AdminDao;

@Service("aService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao aDao;
	
	
}
