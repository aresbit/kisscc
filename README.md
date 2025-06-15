# claunch 🧠🚀

[![ja](https://img.shields.io/badge/lang-ja-green.svg)](README.ja.md)

> A tmux wrapper tool for efficiently managing Claude CLI across multiple projects

`claunch` is a development support tool that separates Claude sessions by project and enables persistent interaction on tmux.

- 🧠 Claude session management per project (automatic resume)
- 🧰 Auto-installs tmux based on OS if not present
- 💻 Supports macOS / Debian-based Linux
- 🔐 Automatically includes `--dangerously-skip-permissions`
- 🔄 Easy session ID storage and reuse

---

## 🚀 Installation (One-liner)

```bash
bash <(curl -s https://raw.githubusercontent.com/0xkaz/claunch/main/install.sh)
```

Or with wget:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/0xkaz/claunch/main/install.sh)
```

> **Note**: This will install `claunch` to `$HOME/bin/claunch`. Make sure `$HOME/bin` is in your PATH.

---

## 📖 Usage

### 1. Start a new Claude session

Navigate to your project directory and run:

```bash
claunch
```

On first run, it will:
- Install tmux automatically if not present
- Start a new Claude session
- Display the session ID to save

### 2. Save the session ID

When Claude starts, you'll see a session ID like `sess-xxxxxxxx`. Save it:

```bash
echo "sess-xxxxxxxx" > ~/.claude_session_PROJECT_NAME
```

### 3. Resume an existing session

Just run `claunch` again in the same project directory. It will automatically:
- Detect the saved session ID
- Resume your previous Claude conversation
- Maintain all context from before

---

## 🛠 Features

### Auto tmux Installation

`claunch` automatically detects and installs tmux if not present:

- **macOS**: Uses Homebrew (`brew install tmux`)
- **Debian/Ubuntu**: Uses apt (`sudo apt install tmux`)
- **Other systems**: Provides manual installation instructions

### Project-based Session Management

Each project gets its own:
- tmux session named `claude-PROJECT_NAME`
- Session ID file at `~/.claude_session_PROJECT_NAME`
- Isolated Claude conversation context

### Persistent Sessions

- Sessions survive terminal closures
- Reconnect anytime with `claunch`
- Multiple projects can run simultaneously

---

## 📝 Requirements

- Claude CLI (`claude` command)
- tmux (auto-installed if missing)
- macOS or Debian-based Linux
- curl or wget for installation

---

## 🤔 FAQ

### Why use claunch?

- **Project isolation**: Keep Claude conversations separate by project
- **Session persistence**: Never lose your context when closing terminal
- **Automatic setup**: No manual tmux configuration needed
- **Multi-tasking**: Work on multiple projects simultaneously

### How do I switch between projects?

Simply `cd` to a different project directory and run `claunch`. Each project maintains its own session.

### Where are session IDs stored?

Session IDs are stored in your home directory as `.claude_session_PROJECT_NAME` files.

### Can I manually attach to tmux sessions?

Yes! Sessions are named `claude-PROJECT_NAME`, so you can:

```bash
tmux attach -t claude-myproject
```

---

## 🐛 Troubleshooting

### "tmux not found" error

The script should auto-install tmux. If it fails:
- **macOS**: Install Homebrew first from https://brew.sh
- **Linux**: Ensure you have sudo permissions
- **Other**: Install tmux manually from https://github.com/tmux/tmux

### Session ID not found

1. Make sure you saved the session ID correctly
2. Check the file exists: `ls ~/.claude_session_*`
3. Verify the session ID format: `sess-xxxxxxxx`

### Can't resume session

If Claude can't resume your session:
1. The session may have expired
2. Start a new session and save the new ID
3. Check Claude's documentation for session limits

---

## 📄 License

MIT License - feel free to use and modify!

---

## 🤝 Contributing

Pull requests welcome! Please:
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

---

Made with ❤️ for the Claude community