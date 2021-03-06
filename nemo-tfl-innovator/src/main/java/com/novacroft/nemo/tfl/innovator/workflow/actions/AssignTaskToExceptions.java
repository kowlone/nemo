package com.novacroft.nemo.tfl.innovator.workflow.actions;

import static com.novacroft.nemo.tfl.common.constant.WorkflowFields.AGENT;
import static com.novacroft.nemo.tfl.common.constant.WorkflowFields.WORKFLOW_ITEM;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.novacroft.nemo.common.utils.StringUtil;
import com.novacroft.nemo.tfl.common.constant.AgentGroup;
import com.novacroft.nemo.tfl.common.transfer.WorkflowItemDTO;

public class AssignTaskToExceptions implements JavaDelegate {
    private static final Logger logger = LoggerFactory.getLogger(AssignTaskToExceptions.class);

    @Autowired
    TaskService taskService;
    @Autowired
    RepositoryService repositoryService;
    @Autowired
    HistoryService historyService;
    @Autowired
    ManagementService managementService;
    @Autowired
    RuntimeService runtimeService;
    @Autowired
    IdentityService identityService;

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        logger.debug("In the AssignTaskToExceptions Class");
        logger.debug("execution id " + execution.getId());
        logger.debug("Assign the task to the exceptions group");

        try {
            WorkflowItemDTO workflowItem = (WorkflowItemDTO) execution.getVariable(WORKFLOW_ITEM);
            workflowItem.setAgent(StringUtil.EMPTY_STRING);
            execution.setVariable(WORKFLOW_ITEM, workflowItem);
            execution.setVariable(AGENT, StringUtil.EMPTY_STRING);
            taskService.addCandidateGroup(execution.getId(), AgentGroup.EXCEPTIONS.code());
        } catch (Exception e) {
            logger.debug("This item has already been claimed!");
            //probably want to avoid this error catch somehow.
        }
    }
}
