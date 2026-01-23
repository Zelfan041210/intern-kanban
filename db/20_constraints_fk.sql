USE intern_kanban;

ALTER TABLE `task`
  ADD CONSTRAINT `fk_task_assignee`
    FOREIGN KEY (`assignee_id`) REFERENCES `user`(`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE `task_tag`
  ADD CONSTRAINT `fk_task_tag`
    FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  ADD CONSTRAINT `uk_task_tag` 
    UNIQUE KEY (`task_id`, `tag`);

ALTER TABLE `task_log`
  ADD CONSTRAINT `fk_task_log_task`
    FOREIGN KEY (`task_id`) REFERENCES `task`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_task_log_operator`
    FOREIGN KEY (`operator_id`) REFERENCES `user` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE;