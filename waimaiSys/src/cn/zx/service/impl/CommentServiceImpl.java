package cn.zx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.Comment;
import cn.zx.mapper.CommentMapper;
import cn.zx.service.CommentService;
@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Resource
	private CommentMapper commentMapper;

	@Override
	public void addComment(Comment comment) {
		commentMapper.addComment(comment);
	}

}
