# Repository Guidelines

## Project Structure & Module Organization

This is an Ansible workstation setup for local developer machines. The main entrypoint is `playbook.yml`, which runs against `localhost` and composes roles from `roles/`.

- `roles/<name>/tasks/` contains role tasks. Use `main.yml` as the dispatcher and keep OS-specific logic in `ubuntu.yml`, `opensuse.yml`, or `macos.yml`.
- `roles/<name>/vars/` and `roles/<name>/defaults/` hold role variables.
- `roles/<name>/templates/` stores Jinja templates; `files/` stores static assets.
- `group_vars/all` contains shared inventory variables.
- Bootstrap and local run scripts live at the repository root.

## Build, Test, and Development Commands

- `./ubuntu-bootstrap.sh`, `./opensuse-bootstrap.sh`, or `./macos-bootstrap.sh`: install platform prerequisites.
- `./setup-local.sh`: apply `playbook.yml` locally without GUI applications.
- `./setup-local-gui.sh`: apply `playbook.yml` locally with `install_gui_apps=yes`.
- `ansible-playbook -i localhost, -c local --ask-become-pass playbook.yml`: run the playbook directly.
- `ansible-playbook -i localhost, -c local --syntax-check playbook.yml`: validate syntax.
- `ansible-playbook -i localhost, -c local test.yml`: run the lightweight experimental test playbook.

## Coding Style & Naming Conventions

Use YAML with two-space indentation. Start Ansible YAML files with `---` where practical. Task names should describe the action, for example `Install packages using brew`. Keep role names lowercase, matching `gui-apps` and `rustlang`.

Use `ansible_facts[...]` for OS checks. Keep OS branching in per-platform task files rather than large conditional blocks in `main.yml`. Shell scripts should stay small, executable, and return the wrapped command status with `exit $?`.

## Testing Guidelines

There is no full automated test suite. Run `ansible-playbook --syntax-check` for `playbook.yml` after YAML or role changes. For platform-specific tasks, run the relevant setup command on that OS or use `--check` where supported:

```sh
ansible-playbook -i localhost, -c local --ask-become-pass --check playbook.yml
```

When adding roles, verify both the default path and GUI-gated behavior.

## Commit & Pull Request Guidelines

Recent commits use concise imperative summaries, for example `Add Git configuration variables and aliases`. Keep the first line specific and under roughly 72 characters.

Pull requests should describe affected roles, supported operating systems, and validation commands. Include screenshots only for visible GUI or prompt changes. Call out manual steps, secrets, or machine-specific assumptions.

## Security & Configuration Tips

Do not commit private keys, tokens, or host-specific secrets. Public keys and static configuration may live under role `files/`, but sensitive local values should be provided through ignored files, environment variables, or Ansible vault if needed.
