package cn.zx.service;

import cn.zx.entity.Audit;

public interface AuditService {
	/**
	 * 添加审核记录
	 * @param audit 
	 * void  
	 * @author ZX 
	 * @date 2019-8-2上午10:51:31
	 */
	public void addAudit(Audit audit);
	/**
	 * 修改审核记录
	 * @param audit 
	 * void  
	 * @author ZX 
	 * @date 2019-8-2上午10:51:45
	 */
	public void updateAudit(Audit audit);
}
