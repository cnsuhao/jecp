package net.loyin.ctrl.wkflow;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;

import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

/**
 * activiti
 * 
 * @author loyin 2013-5-5 下午5:18:03
 */
@SuppressWarnings("rawtypes")
@RouteBind(path = "wkflow")
@Before(IocInterceptor.class)
public class ActivitiCtrl extends AdminBaseController {
	@Inject.BY_NAME
	private ProcessEngine processEngine;
	@Inject.BY_NAME
	private RepositoryService repositoryService;
	@Inject.BY_NAME
	private RuntimeService runtimeService;
	@Inject.BY_NAME
	private FormService formService;
	@Inject.BY_NAME
	private IdentityService identityService;
	@Inject.BY_NAME
	private TaskService taskService;
	@Inject.BY_NAME
	private HistoryService historyService;
	@Inject.BY_NAME
	private ManagementService managementService;
	
	public void index(){
		
	}
}
