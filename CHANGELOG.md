# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Placeholder for upcoming template-specific enhancements.

## [0.2.0] - 2025-10-18

### Changed
- **Standardized Development Environment:** Refactored the Nix configuration (`.idx/dev.nix`) across the root project and all templates for consistency and maintainability.
- **Integrated Custom Tooling:** The `contextvibes` CLI is now included as a reproducible Nix package, fetched directly from its GitHub release. This replaces the need for manual installation scripts.
- **Updated AI Guidance:** Aligned the root `.idx/airules.md` with the new tooling and updated terminology from "Firebase Studio" to "Project IDX".

## [0.1.0] - 2025-06-17

### Added
- **Initial Release of the Google Apps Script Kickstart Collection!**
- **Root Project Structure:**
    - `idx-template.json`: Defines the collection for Project IDX.
    - `idx-template.nix`: Bootstraps selected templates.
    - Root `.idx/dev.nix`: Development environment for the collection.
    - Root `.idx/airules.md`: AI Steward guidance for managing the collection.
    - Root `README.md`, `CONTRIBUTING.md`, `LICENSE`.
- **`apps-script-starter-template` (v0.1.0):**
    - Minimal template for simple scripts and learning GAS.
- **`apps-script-module-template` (v0.1.0):**
    - Template for modular GAS web applications with example modules.
- **`apps-script-api-connector-template` (v0.1.0):**
    - Framework for connecting to external APIs and syncing data to Google Sheets.
