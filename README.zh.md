# kisscc 🧠🚀

![claunch](claunch-banner.png)

[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)

> 轻量级会话管理器，高效管理多个项目的 kimicc

`kisscc` 是一个开发支持工具，可以按项目分离 kimicc 会话，并提供可选的 tmux 支持以实现持久交互。

- 🧠 按项目进行 kimicc 会话管理（自动恢复）
- ⚡ 默认轻量级直接执行
- 🧰 可选 tmux 支持实现持久会话
- 💻 支持 macOS / Debian 系 Linux
- 🔄 易于存储和重用会话 ID

---

## 🚀 安装（一行命令）

```bash
bash <(curl -s https://raw.githubusercontent.com/aresbit/kisscc/main/install.sh)
```

或使用 wget：

```bash
bash <(wget -qO- https://raw.githubusercontent.com/aresbit/kisscc/main/install.sh)
```

> **注意**：这将把 `kisscc` 安装到 `$HOME/bin/kisscc`。请确保 `$HOME/bin` 在您的 PATH 中。

---

## 📖 使用方法

### 1. 启动新的 kimicc 会话

导航到您的项目目录并运行：

```bash
kisscc        # 启动直接 kimicc 会话（默认）
kisscc --tmux # 使用 tmux 启动持久会话
```

首次运行时：
- 如果使用 tmux 模式，会自动安装 tmux（如果未安装）
- 启动新的 kimicc 会话
- 显示要保存的会话 ID

#### 直接模式 vs tmux 模式

- **直接模式**（默认）：轻量级，无 tmux 依赖，直接 kimicc 交互
- **tmux 模式**（`--tmux`）：持久会话，后台执行，滚动历史

### 2. 保存会话 ID

当 kimicc 启动时，您会看到类似 `sess-xxxxxxxx` 的会话 ID。保存它：

```bash
echo "sess-xxxxxxxx" > ~/.claude_session_项目名称
```

### 3. 恢复现有会话

只需在同一项目目录中再次运行 `claunch`（或 `claunch --tmux`）。它会自动：
- 检测保存的会话 ID
- 恢复之前的 kimicc 对话
- 保持之前的所有上下文

### 4. 其他命令

```bash
claunch list     # 列出所有活动会话
claunch clean    # 清理孤立的会话文件
claunch --help   # 显示帮助和选项
```

---

## 🛠 功能

### 自动 tmux 安装（使用 --tmux 时）

当使用 `--tmux` 选项时，`claunch` 会自动检测并在 tmux 不存在时安装：

- **macOS**：使用 Homebrew (`brew install tmux`)
- **Debian/Ubuntu**：使用 apt (`sudo apt install tmux`)
- **其他系统**：提供手动安装说明

### 基于项目的会话管理

每个项目都有自己的：
- 会话 ID 文件位于 `~/.claude_session_项目名称`
- 隔离的 kimicc 对话上下文
- 可选的 tmux 会话命名为 `claude-项目名称`（使用 `--tmux` 时）

### 持久会话（tmux 模式）

使用 `claunch --tmux`：
- 会话在终端关闭后仍保持活动
- 随时可以用 `claunch --tmux` 重新连接
- 可以同时后台运行多个项目

### tmux 操作指南

通过 `claunch --tmux` 运行 kimicc 时，您处于 tmux 会话中。以下是基本命令：

- **分离会话**：按 `Ctrl+B` 然后按 `D`
  - 保持 kimicc 在后台运行
  - 返回正常终端
- **上下滚动**：按 `Ctrl+B` 然后按 `[` 进入复制模式
  - 使用方向键或 Page Up/Down 滚动
  - 按 `q` 退出复制模式
- **复制文本**：在复制模式中（`Ctrl+B` 然后 `[`）：
  - 将光标移动到起始位置
  - 按 `空格` 开始选择
  - 移动到结束位置
  - 按 `回车` 复制
- **粘贴文本**：按 `Ctrl+B` 然后按 `]`
- **终止会话**：按 `Ctrl+B` 然后按 `&`（谨慎使用）

> **提示**：您也可以用 `tmux attach -t claude-项目名称` 手动附加到会话

---

## 📝 要求

- Node.js/npm 和 kimicc (`npm install -g kimicc`)
- tmux（如缺失则自动安装）
- macOS 或 Debian 系 Linux
- curl 或 wget 用于安装

---

## 🤔 常见问题

### 为什么要使用 claunch？

- **项目隔离**：按项目保持 kimicc 对话分离
- **会话持久性**：关闭终端时不会丢失上下文
- **自动设置**：无需手动 tmux 配置
- **多任务处理**：可同时处理多个项目

### 如何在项目间切换？

只需 `cd` 到不同的项目目录并运行 `claunch`。每个项目都维护自己的会话。

### 会话 ID 存储在哪里？

会话 ID 存储在您主目录中的 `.claude_session_项目名称` 文件中。

### 可以手动附加到 tmux 会话吗？

是的！会话命名为 `claude-项目名称`，因此您可以：

```bash
tmux attach -t claude-myproject
```

---

## 🐛 故障排除

### "tmux not found" 错误

脚本应自动安装 tmux。如果失败：
- **macOS**：首先从 https://brew.sh 安装 Homebrew
- **Linux**：确保您有 sudo 权限
- **其他**：从 https://github.com/tmux/tmux 手动安装 tmux

### 找不到会话 ID

1. 确保您正确保存了会话 ID
2. 检查文件是否存在：`ls ~/.claude_session_*`
3. 验证会话 ID 格式：`sess-xxxxxxxx`

### 无法恢复会话

如果 kimicc 无法恢复您的会话：
1. 会话可能已过期
2. 启动新会话并保存新 ID
3. 查看 kimicc 文档了解会话限制

---

## 📄 许可证

MIT 许可证 - 请随意使用和修改！

---

## 🤝 贡献

欢迎提交拉取请求！请：
1. Fork 仓库
2. 创建您的功能分支
3. 提交您的更改
4. 推送到分支
5. 打开拉取请求

---

为 kimicc 社区用心制作 ❤️