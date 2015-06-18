package com.novacroft.nemo.tfl.innovator.workflow.actions;

import static com.novacroft.nemo.test_support.ApprovalTestUtil.EXECUTION_ID;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.junit.Before;
import org.junit.Test;

import com.novacroft.nemo.tfl.common.constant.AgentGroup;
import com.novacroft.nemo.tfl.common.transfer.WorkflowItemDTO;

public class AssignTaskToStageOneTest {
    private AssignTaskToStageOneApproval assignTaskToStageOneApproval;
    private TaskService mockTaskService;
    private DelegateExecution mockExecution;
    private WorkflowItemDTO mockWorflowItem;

    @Before
    public void setUp() {
        assignTaskToStageOneApproval = new AssignTaskToStageOneApproval();
        mockTaskService = mock(TaskService.class);
        mockExecution = mock(DelegateExecution.class);
        mockWorflowItem = mock(WorkflowItemDTO.class);
        assignTaskToStageOneApproval.taskService = mockTaskService;
    }

    @Test
    public void shouldAssignTaskToExceptionsGroup() throws Exception {
        when(mockExecution.getId()).thenReturn(EXECUTION_ID);
        when(mockExecution.getVariable(anyString())).thenReturn(mockWorflowItem);
        doNothing().when(mockTaskService).addCandidateGroup(anyString(), anyString());
        assignTaskToStageOneApproval.execute(mockExecution);
        verify(mockTaskService).addCandidateGroup(EXECUTION_ID, AgentGroup.FIRST_STAGE_APPROVER.code());
    }

}
