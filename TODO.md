# TODO - intern-kanban

> 目标：用最小但完整的 Kanban 项目覆盖 MySQL / SQL / Spring Boot / JDBC(MyBatis) / Vue 的基础能力。

>  原则：每一项都尽量有“可验收标准（Acceptance）”。

---

## ✅ Day1 Done (Foundation / 可复现环境)
- [x] Git 仓库初始化 + 基础目录结构（backend/db/frontend/docs）
- [x] DB 脚本拆分并提交：建库 / 建表 / 外键约束 / 索引 / seed
- [x] `db/README.md`：脚本执行顺序 + 验收 SQL
- [x] seed 数据插入成功，基础 SELECT/JOIN 可查
- [x] Spring Boot 骨架创建（Java8 + Boot 2.7.6 + Web + Actuator + MyBatis + MySQL）
- [x] `application-local.properties` 本地 profile 连 MySQL（不入库）
- [x] Actuator 验收：`/actuator/health` -> `status=UP` 且 `db=UP`
- [x] `.gitignore` 生效（敏感配置不提交）

## 🔥 Day2 (Backend API - 最小闭环)
### 2.1 工程结构 & 通用约定
- [ ] 统一包结构
    - `controller/ service/ mapper/ entity/ dto/ vo/ config/`
    - Acceptance：包结构清晰，类职责单一
- [ ] 统一接口返回格式（建议）
    - `code / message / data`
    - Acceptance：所有 API 返回结构一致
- [ ] 全局异常处理（建议）
    - 参数错误、资源不存在、DB 异常
    - Acceptance：异常返回可读、前端可处理

### 2.2 Task APIs（必须做）
- [ ] GET `/api/tasks?status=TODO|DOING|DONE`
    - Acceptance：按 status 返回任务列表（含 assignee 昵称/用户名）
- [ ] POST `/api/tasks`
    - 字段：title（必填）、description、priority、assigneeId、dueTime
    - Acceptance：插入成功，DB `task` 表出现新记录
- [ ] PUT `/api/tasks/{id}/status`
    - 行为：更新 `task.status` + 插入一条 `task_log`
    - Acceptance：两个操作同一事务；任一失败都回滚
- [ ] GET `/api/tasks/{id}`
    - Acceptance：返回 task 详情 + tags + logs（可以先后端多次查询再拼）
- [ ] DELETE `/api/tasks/{id}`（可选）
    - Acceptance：根据外键策略正确处理 tag/log（删除或级联）

### 2.3 Tag & Log（建议做，能体现掌握度）
- [ ] POST `/api/tasks/{id}/tags`
    - Acceptance：插入 `task_tag`，重复标签不产生重复记录（靠唯一约束/INSERT IGNORE）
- [ ] GET `/api/tasks/{id}/logs`
    - Acceptance：按时间倒序返回日志

### 2.4 MyBatis（把 warn 修掉）
- [ ] 配置 Mapper 扫描（`@MapperScan` 或 mapper 注解）
    - Acceptance：启动日志不再出现 “No MyBatis mapper was found”
- [ ] TaskMapper / TaskLogMapper / TaskTagMapper 基本方法
    - Acceptance：API 正常工作，SQL 可控且可读

---

## 🌱 Day3 (Frontend - Vue 看板)
- [ ] 初始化 Vue 项目（Vite 或 Vue CLI 任选）
    - Acceptance：能启动并访问本地页面
- [ ] 看板 UI：三列 TODO/DOING/DONE
    - Acceptance：页面上能看到三列布局
- [ ] 拉取任务并渲染
    - Acceptance：分别调用 `/api/tasks?status=...` 渲染到对应列
- [ ] 新建任务表单
    - Acceptance：提交后列表刷新能看到新任务
- [ ] 改状态（按钮或简易拖拽）
    - Acceptance：调用 PUT status 成功，任务移动到新列

---

## 🧪 Day4 (Integration & Quality)
- [ ] 前后端联调完善（错误提示、loading、空列表提示）
- [ ] 基础参数校验（后端 @Valid / 前端表单校验）
- [ ] 最少 3 个接口测试（Postman collection 或简单单测）
    - Acceptance：能一键跑通关键流程
- [ ] 文档：`docs/api.md`
    - Acceptance：列出所有 API、请求/响应示例、错误码

---

## Backlog (Optional)
- [ ] 简单认证（demo 登录 / token）
- [ ] 任务搜索（title 模糊 / tag 过滤）
- [ ] 统计：各状态数量、近 7 天完成数
- [ ] Swagger/OpenAPI 文档
