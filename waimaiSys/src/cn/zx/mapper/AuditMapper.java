package cn.zx.mapper;

import cn.zx.entity.Audit;

public interface AuditMapper {
	public void addAudit(Audit audit);
	public void updateAudit(Audit audit);
	public Audit findAudit(Audit audit);
}
