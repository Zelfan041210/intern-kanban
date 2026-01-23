# Database Setup (intern-kanban)

本目录包含项目数据库的初始化脚本（MySQL 8.4.8），按照脚本顺序即可完成：
- 建库
- 建表
- 外键/约束
- 索引
- 测试数据（seed）

## Prerequisites
- MySQL 8.4.8 (本机：localhost：3306)
- 使用DBeaver进行数据库管理

## Scripts Overview
| 文件 | 作用     | 说明 |
|------|--------|------|
| `00_created_db.sql` | 创建数据库与字符集 | 仅负责建库（例如 `intern_kanban`） |
| `10_tables.sql` | 创建表结构  | 只建表（不含外键/复杂约束） |
| `20_constraints_fk.sql` | 添加外键与约束 | 依赖 10_tables.sql 已执行 |
| `30_indexes.sql` | 添加索引   | 依赖 10_tables.sql 已执行 |
| `90_seed.sql` | 插入测试数据 | 依赖 10/20 已执行 |

## Execution Order
按照以下顺序执行（必须）：

1. `00_created_db.sql`
2. `10_tables.sql`
3. `20_constraints_fk.sql`
4. `30_indexes.sql`
5. `90_seed.sql`

> 推荐使用 DBeaver 的 **Execute Script（执行脚本）** 来运行整个文件，避免只执行单行语句导致的问题。

---

## Run with DBeaver
1. 打开DBeaver，连接到本地MySQL (`localhost: 3306`)
2. 依次打开并执行上述脚本（右键工具栏：**执行脚本 Execute Script**
3. 执行完后刷新数据库

## Verification
执行完所有脚本后，在SQL编辑器运行以下以检查：

###  1) 确认数据库存在并已选中
``` sql
SHOW  DATABASE LIKE `intern_kanban`;
SELECT DATABASE();  