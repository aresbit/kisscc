# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2024-01-15

### Added
- Initial release of claunch
- Core functionality to manage Claude CLI sessions with tmux
- Automatic tmux installation for macOS (Homebrew) and Debian-based Linux (apt)
- Per-project session management with automatic resume capability
- Session ID persistence in `~/.claude_session_PROJECT_NAME` files
- `--version` flag support
- Comprehensive documentation in English and Japanese
- MIT License
- Installation script for easy setup

### Features
- 🧠 Claude session management per project (automatic resume)
- 🧰 Auto-installs tmux based on OS if not present
- 💻 Supports macOS / Debian-based Linux
- 🔐 Automatically includes `--dangerously-skip-permissions`
- 🔄 Easy session ID storage and reuse

[0.0.1]: https://github.com/0xkaz/claunch/releases/tag/v0.0.1