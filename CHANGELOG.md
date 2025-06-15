# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.4] - 2025-01-15

### Changed
- **Breaking Change**: Default behavior is now direct execution (no tmux)
- Replaced `--no-tmux` with `--tmux` option
- Updated help documentation and examples

### Improved
- Lighter default experience without tmux dependency
- tmux support available when needed with `--tmux` flag

## [0.0.3] - 2025-01-15

### Added
- `--no-tmux` option for direct Claude execution without tmux
- `--help` command with detailed usage information
- Support for lightweight mode without tmux dependency

### Removed
- Typo handlers (clauch, launch) - keeping it simple with just claunch

### Changed
- Improved command-line argument parsing
- Enhanced help documentation

## [0.0.2] - 2025-01-15

### Added
- Claude CLI existence check before execution
- Session ID validation (must match sess-xxxxxxxx format)
- Security warning prompt on first use
- Session management commands:
  - `claunch list` - List all active sessions
  - `claunch clean` - Clean up orphaned session files
- Typo handlers (clauch, launch) for common misspellings (removed in v0.0.3)

### Fixed
- Duplicate tmux configuration code (now uses function)
- Empty session file handling
- Invalid session ID format handling

### Security
- Added warning about --dangerously-skip-permissions flag
- User must acknowledge security implications on first use

## [0.0.1] - 2025-01-15

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

[0.0.4]: https://github.com/0xkaz/claunch/releases/tag/v0.0.4
[0.0.3]: https://github.com/0xkaz/claunch/releases/tag/v0.0.3
[0.0.2]: https://github.com/0xkaz/claunch/releases/tag/v0.0.2
[0.0.1]: https://github.com/0xkaz/claunch/releases/tag/v0.0.1