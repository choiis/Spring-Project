package com.singer.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SuperDao {

	@Inject
	private SqlSession sqlSession;

	@SuppressWarnings("rawtypes")
	protected List selectList(String statement, Object vo) {
		return sqlSession.selectList(statement, vo);
	}

	protected Object selectOne(String statement) {
		return sqlSession.selectOne(statement);
	}

	protected Object selectOne(String statement, Object vo) {
		return sqlSession.selectOne(statement, vo);
	}

	protected int selectCnt(String statement, Object vo) {
		return sqlSession.selectOne(statement, vo);
	}

	@SuppressWarnings("rawtypes")
	protected List selectList(String statement) {
		return sqlSession.selectList(statement);
	}

	protected int update(String statement, Object vo) {
		return sqlSession.update(statement, vo);
	}

	protected int insert(String statement, Object vo) {
		return sqlSession.insert(statement, vo);
	}

	protected int delete(String statement, Object vo) {
		return sqlSession.delete(statement, vo);
	}
}
