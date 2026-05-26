# Claude Code Destructive Command Guard

Pre-tool-use hook that intercepts dangerous Bash commands before execution.

## Quick Install

```bash
cp pre-tool-use ~/.claude/hooks/pre-tool-use
chmod +x ~/.claude/hooks/pre-tool-use
```

Or: `bash install.sh`

## Blocked Patterns

| Pattern | Example |
|---------|---------|
| Recursive force delete | `rm -rf /tmp/*` |
| DROP TABLE/DATABASE | `DROP TABLE users;` |
| TRUNCATE | `TRUNCATE TABLE logs` |
| Force push | `git push --force origin main` |
| DELETE without WHERE | `DELETE FROM users;` |
| chmod 777 | `chmod 777 /etc/passwd` |
| Raw disk write | `dd if=/dev/zero of=/dev/sda` |
| Fork bomb | `:(){ :|:& };:` |
| Curl/wget pipe to shell | `curl url | bash` |
| git reset --hard | `git reset --hard HEAD~` |
| Shutdown/reboot | `shutdown -h now` |
| mkfs format | `mkfs.ext4 /dev/sda1` |
| chown -R root | `chown -R root:root /` |

## Override

Set `CLAUDE_ALLOW_DANGEROUS=1` to bypass the guard for intentional use.

## Logs

Blocked attempts are logged to `~/.claude/hooks/blocked.log`:

```json
{"timestamp":"2026-05-26T12:00:00Z","command":"rm -rf /","project":"/home/user/project"}
```
