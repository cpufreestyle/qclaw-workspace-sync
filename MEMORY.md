# MEMORY.md - Long-term Memory

## 2026-06-12 - Docker Daemon Unresponsive

### Incident
- **Time**: 2026-06-12 03:25-03:27 (GMT+8)
- **Trigger**: Async command "brisk-ha" failed with Docker timeout (exit code 1)
- **Task**: Stock-CrewAI 交易摘要同步 (heartbeat linkage task, every 2 hours)
- **Symptom**: All Docker CLI commands hang and eventually timeout (SIGKILL)
- **Docker Desktop**: Processes running and responding, but daemon not accepting commands

### Troubleshooting Attempted
1. ✗ Killed and restarted Docker Desktop process
2. ✗ `wsl --shutdown` to restart WSL2 backend
3. ✗ Restarted Docker Windows service (`com.docker.service`)
4. ✗ Waited up to 20 seconds after each restart attempt

### Root Cause
Docker daemon/engine is in a hung state. GUI may show as running, but CLI cannot communicate with daemon.

### Resolution Required (Manual)
User (Michael) needs to:
1. Check Docker Desktop GUI for error messages
2. Right-click Docker system tray icon → "Restart"
3. If persists: Docker Desktop → Troubleshoot → "Reset to factory defaults"
4. Verify fix: `docker ps` should work without timeout

### Workaround Applied
- Updated `memory/heartbeat-state.json` with `skip_until_manual_fix: true` flag
- Stock-sync task will be skipped until Docker is confirmed working
- Next heartbeat will check if Docker is responsive before attempting stock-sync

### Lessons Learned
- Docker on Windows can show as "running" but daemon is unresponsive
- Multiple restart attempts (Docker Desktop, WSL2, service) may not fix daemon issues
- Always have a manual intervention path documented
- Set skip flags to prevent repeated timeout failures in heartbeat tasks

### Files Modified
- `memory/heartbeat-state.json` - Added dockerIssue section, skip flag
- `docker-timeout-incident_2026-06-12-0326.md` - Detailed incident report

---

## 2026-06-25 - Daily Gitee Memory Push Cron

### 新增
- 创建 `push-to-gitee.sh`：将本地 MEMORY.md、memory/、brain pages 推送到 Gitee
- 设置 cron 任务：**每天 04:00 Asia/Shanghai** 执行推送
- 推送目标仓库：
- `gitee.com/cpufreestyle/qclaw-workspace-sync`（workspace 记忆文件）
- `gitee.com/cpufreestyle/gbrain-sync`（brain pages）

### 现有同步（共存）
- launchd 拉取已卸载，改为 cron 双向同步（每天 04:00，local wins）
- **cron 推送**：每天凌晨 4 点从本地推送到 Gitee（`push-to-gitee.sh`）

### 相关文件
- 推送脚本：`~/.qclaw/workspace/push-to-gitee.sh`
- 推送日志：`/tmp/qclaw-push.log`

### 注意事项
- 脚本使用 Gitee OAuth2 Token 认证（同 `sync-from-gitee.sh`）
- Token 过期需同时更新两个脚本

## Promoted From Short-Term Memory (2026-06-13)

- **拉取失败**: `git@gitee.com: Permission denied (publickey)`

## Promoted From Short-Term Memory (2026-06-14)

- **时间**: 2026-06-08 13:30 GMT+8 **结果**: BUILD SUCCESSFUL, APK 13.68MB
- | # | 问题 | 修复 | |---|------|------| | 1 | Gradle 8.8 下载超时 | 腾讯镜像下载 | | 2 | 缺少 local.properties | 创建 sdk.dir 配置 |
- | 3 | 离线模式无缓存依赖 | 放弃离线，添加阿里云 Maven 镜像 | | 4 | 缺少 AndroidX 属性 | 添加 gradle.properties | | 5 | 不存在的 Maven 依赖 | 移除 litert-lm, TextToSpeech, camera-image-analysis | | 6 | AndroidManifest 解析错误 | 移除属性中间的中文注释、不存在的 Service |
- | 7 | 缺少 launcher 图标和 roi_frame | 使用 Android 系统图标，创建 drawable | | 8 | Kotlin 编译错误（LiteRTLM/AICoreManager 不存在） | 重写 AIInferenceManager（mock）、MainActivity |

## Promoted From Short-Term Memory (2026-06-15)

- Sync completed successfully
- Sync Results:

## Promoted From Short-Term Memory (2026-06-17)

- C盘空间严重不足，清理了 `wiki/build` 目录释放约 9MB。
- **Auto-fetch 结果（16:15）：**
- 上次成功执行所有心跳任务。

## Promoted From Short-Term Memory (2026-06-18)

- **主要空间占用：**
- **风控重点：** 熊市严禁扛单，触发止损无条件离场

## 2026-07-12 - 观猹 AI PM 共学营 Day 4~6 作业完成

### 概述
在 7/11~7/12 凌晨集中完成了共学营 Day 4~6 的全部作业提交。

### 关键技术经验
- **watcha.cn SPA 架构**: Vue.js 单页应用，课程内容需浏览器渲染（xbrowser/CfT），非 SPA 静态页面
- **ProseMirror 富文本编辑器**: fill/type 无法触发 Vue 状态更新，需用 CDP Input.dispatchKeyEvent 或直接 API 提交
- **watcha API 提交格式**: POST /api/v2/discuss/floors 用 `post_id`（下划线）而非 `postId`（驼峰），content 需 ProseMirror JSON 格式，images: ""
- **飞书问卷提交**: radio 选项需 CDP Input.dispatchMouseEvent 点击准确坐标，contenteditable div 需 focus + insertText + blur
- **CDP 文件上传**: 使用 DOM.setFileInputFiles 方法可直接设置文件路径

### 作业完成状态
- Day 4: ✅ reviewing（LiveWiki Vibe Coding 原型）
- Day 5: ✅ reviewing（LiveWiki 增长方案）
- Day 6: ✅ 提交成功（AI PM 简历 PDF，飞书问卷）

### 重要文件
- AI_PM_Resume.pdf — Day 6 简历
- watcha-day5-video-summary_2026-07-12-0030.md — Day 5 视频总结
- memory/2026-07-12.md — 详细日 memory

## Promoted From Short-Term Memory (2026-06-19)

- **关键修复**：

## 2026-07-13 - 项目默认目录

### 新增默认目录
- **路径**: `/Users/a1-6/AI Shared/repo`
- **用途**: 以后所有软件项目默认存放在此目录
- **当前项目**:
- `livewiki-demo/` — LiveWiki AI 直播知识沉淀引擎
- `livewiki-demo-old/` — LiveWiki 旧版文件备份
- 其他项目略

### 更新
- LiveWiki 仓库已上传 Gitee: https://gitee.com/cpufreestyle/livewiki-demo

## Promoted From Short-Term Memory (2026-07-15)

- 21:10 - 目录结构调整: 梳理了 /Users/a1-6/workspace/ 目录结构，规划将多客户端共享的部分拆出; 在 shared/ 下创建了 repo/ 目录用于存放所有项目; 将 notes/、sessions/、memory/ 移回根目录，不放入共享; 将 shared/ 移动到 /Users/a1-6/Public/ 并更名为 AI Shared
- 21:10 - 目录结构调整: 软件仓库目录名偏好使用 repo/
- Day 4（7/12 00:00 提交）: **课程**: Oil 欧哟（林志煌）— 从 0 到 1 做一个 AI 产品; **主题**: API、模态、无状态、上下文、Token、TPS、结构化输出、Agent（AI 狼人杀案例）; **作业**: 使用 Vibe Coding 快速搭建 AI 产品原型（必做 +50 分）; **产品**: LiveWiki — AI 直播课程知识沉淀引擎
