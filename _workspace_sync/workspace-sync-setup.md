# QClaw 工作区云端同步指南

## 仓库地址
https://gitee.com/cpufreestyle/qclaw-workspace-sync

## 在新电脑上恢复（两步）

### 第一步：克隆仓库到工作区
```powershell
git clone https://gitee.com/cpufreestyle/qclaw-workspace-sync.git C:\Users\你的用户名\.qclaw\workspace
```

### 第二步：合并/覆盖文件到 QClaw 工作区

---

## 日常同步操作

直接在文件资源管理器中双击运行：
```
_workspace_sync\sync-workspace.ps1
```

或右键 → 使用 PowerShell 运行。

这会自动将本地更改推送到云端仓库。

---

## 同步脚本功能

`sync-workspace.ps1` 会执行：
1. 切换到工作区根目录
2. 添加所有更改（`git add -A`）
3. 提交（带时间戳）
4. 推送到远程仓库

## 注意事项

- 首次使用需配置 Git 用户信息（如未设置）：
  ```powershell
  git config --global user.name "你的名字"
  git config --global user.email "你的邮箱"
  ```
- 同步前请确认 Gitee 账号已登录（或配置了 SSH 公钥）
- 敏感信息不要放入工作区同步（检查 `.gitignore` 是否已排除）