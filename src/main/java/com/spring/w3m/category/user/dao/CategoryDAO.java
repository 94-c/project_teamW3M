package com.spring.w3m.category.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	
}
