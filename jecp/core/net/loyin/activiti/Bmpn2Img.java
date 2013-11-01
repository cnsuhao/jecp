package net.loyin.activiti;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;

public class Bmpn2Img {

	public static void main(String[] args) {
		ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
		RuntimeService runtimeService = processEngine.getRuntimeService();
		RepositoryService repositoryService = processEngine.getRepositoryService();

		TaskService taskService = processEngine.getTaskService();
		ManagementService managementService = processEngine.getManagementService();
		IdentityService identityService = processEngine.getIdentityService();
		HistoryService historyService = processEngine.getHistoryService();
		FormService formService = processEngine.getFormService();

		Map<String, Object> variableMap = new HashMap<String, Object>();
		ProcessInstance instance = runtimeService.startProcessInstanceByKey("MultitaskingProcess", variableMap);

		File f = new File("processInstanceImage.png");
		File f2 = new File("processDefintion.png");
		FileOutputStream fos1 = null;
		FileOutputStream fos2 = null;
		ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService).getDeployedProcessDefinition(instance.getProcessDefinitionId());
		System.out.println("id" + instance.getId());
		List<Execution> executions = runtimeService.createExecutionQuery().processInstanceId(instance.getId()).list();
		List<String> activitiIds = runtimeService.getActiveActivityIds(instance.getId());
		for (String s : activitiIds) {
			System.out.println("s:" + s);
		}

		/*if (processDefinition != null&& processDefinition.isGraphicalNotationDefined()) {
			try {
				InputStream processInstanceImage = ProcessDiagramGenerator.generateDiagram(processDefinition, "png", activitiIds);
				InputStream processDefintion = ProcessDiagramGenerator.generatePngDiagram(processDefinition);
				fos1 = new FileOutputStream(f);
				fos2 = new FileOutputStream(f2);
				byte[] buff = new byte[1024 * 10];
				int len = 0;
				while ((len = processInstanceImage.read(buff)) != -1) {
					System.out.println("--------------" + len);
					fos1.write(buff, 0, len);
				}
				while ((len = processDefintion.read(buff)) != -1) {
					System.out.println("++++++++++++++" + len);
					fos2.write(buff, 0, len);
				}

			} catch (Throwable t) {
				t.printStackTrace();
			} finally {
				try {
					fos1.flush();
					fos1.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

				try {
					fos2.flush();
					fos2.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}

		}*/

	}
}
