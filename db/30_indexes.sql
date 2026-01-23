USE intern_kanban;

CREATE INDEX `idx_task_status`	 ON `task` (`status`);
CREATE INDEX `idx_task_assignee` ON `task` (`assignee_id`);
CREATE INDEX `idx_task_due_time` ON `task` (`due_time`);

CREATE INDEX `idx_task_tag`    	 ON `task_tag`(`tag`);

CREATE INDEX `idx_log_task_id`	 ON `task_log` (`task_id`);
CREATE INDEX `idx_log_created_at` ON `task_log` (`created_at`);

SHOW INDEX FROM `task_log`;