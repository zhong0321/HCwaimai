package cn.zx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.Audit;
import cn.zx.mapper.AuditMapper;
import cn.zx.service.AuditService;
@Service("auditService")
public class AuditServiceImpl implements AuditService {
	@Resource
	private AuditMapper auditMapper;

	@Override
	public void addAudit(Audit audit) {
		auditMapper.addAudit(audit);
	}

	@Override
	public void updateAudit(Audit audit) {
		auditMapper.updateAudit(audit);
	}

}
