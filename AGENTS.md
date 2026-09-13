# AGENTS.md

Guidance for coding agents working in this repo. Operator docs live in [README.md](README.md).

## Project Overview

Homebrew tap for @icco's projects (`icco/homebrew-tap`, tapped as `icco/tap`).

## Layout

- `Casks/` — Homebrew Cask ruby definitions (`art`, `bugsim`, `etu`, `gitstatus`, `gotak`).
- `.github/workflows/` — CI workflows:
  - `pr-title.yml` — Semantic PR title validation.
  - `yaml-json.yml` — YAML and JSON formatting and linting.

## Architecture & Invariants

- Cask files in `Casks/` are primarily generated and updated by GoReleaser from upstream repositories upon release.
- Homebrew deprecates raw Ruby `postflight` blocks; casks must use the declarative `postflight_steps` block for post-install actions (such as removing macOS quarantine attributes).
- Keep descriptions, URLs, and artifact paths consistent with their respective upstream repositories.

## Conventions

- PR titles and commits must follow Conventional Commits (`feat`, `fix`, `docs`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`, `style`) with lowercase subjects and no trailing period.
- Cask changes should adhere to Homebrew rubocop standards (`brew style Casks/`).
- YAML files must conform to `.yamllint.yml`.

## Commands

```sh
brew style Casks/                     # Lint and check style of all casks
brew audit --cask Casks/<cask>.rb     # Run Homebrew cask audits
```
