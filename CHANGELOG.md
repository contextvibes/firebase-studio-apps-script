# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Placeholder for upcoming changes.

## [0.1.0] - YYYY-MM-DD <!-- TODO: Update with release date -->

### Added
- **Initial Release of the Google Apps Script Kickstart Collection!**
- **Root Project Structure:**
    - `idx-template.json`: Defines the collection for Firebase Studio.
    - `idx-template.nix`: Bootstraps selected templates.
    - Root `.idx/dev.nix`: Development environment for the collection.
    - Root `.idx/airules.md`: AI Steward guidance for managing the collection.
    - Root `README.md`, `CONTRIBUTING.md`, `LICENSE`.
- **`apps-script-starter-template` (v0.1.0):**
    - Minimal template for simple scripts and learning GAS.
    - Includes `src/Code.js` with basic `Logger.log` and Sheets custom function examples.
    - Basic `src/appsscript.json`.
    - Template-specific `README.md`, `.idx/dev.nix`, and `.idx/airules.md`.
- **`apps-script-module-template` (v0.1.0):**
    - Template for modular GAS web applications.
    - Includes `src/webapp.js`, `src/index.html`, and example modules in `src/modules/` (ErrorManager, TimeManager, LogManager, ExampleService).
    - Web app configured `src/appsscript.json`.
    - Template-specific `README.md`, `.idx/dev.nix`, and `.idx/airules.md`.
- **`apps-script-api-connector-template` (v0.1.0):**
    - Framework for connecting to external APIs and syncing data to Google Sheets.
    - Includes modules for API connection (`src/connectors/`), authentication (`src/core/AuthManager.js`), data sync (`src/sync/SheetSyncService.js`), and scheduling (`src/core/MainSyncScheduler.js`).
    - `src/appsscript.json` configured for `UrlFetchApp` and Sheets.
    - Template-specific `README.md`, `.idx/dev.nix` (with linters/formatters planned), and `.idx/airules.md`.