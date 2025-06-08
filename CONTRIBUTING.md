# Contributing to Google Apps Script Kickstart for Firebase Studio

First off, thank you for considering contributing! Your help is essential for making this template collection even better. We welcome contributions of all kinds, from reporting bugs and proposing new features to submitting pull requests for new templates, code improvements, or documentation enhancements.

Please take a moment to review this document to understand how you can contribute effectively.

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md) (TODO: Create this file). By participating, you are expected to uphold this code. Please report unacceptable behavior.

## How Can I Contribute?

### Reporting Bugs
*   Ensure the bug was not already reported by searching on GitHub under [Issues](https://github.com/duizendstra/gas-template-tmp/issues).
*   If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/duizendstra/gas-template-tmp/issues/new). Be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample or an executable test case** demonstrating the expected behavior that is not occurring.

### Suggesting Enhancements or New Templates
*   Open a new issue to discuss your idea. This allows us to coordinate efforts and ensure your suggestion aligns with the project's goals.
*   For new template ideas, please outline:
    *   The primary use case and target audience.
    *   A proposed file structure.
    *   Key features or GAS APIs it would showcase.
    *   How it would differ from existing templates.

### Pull Requests
We welcome pull requests for bug fixes, improvements, and new features.

1.  **Fork the repository** and create your branch from `main` (or the relevant development branch).
2.  **Set up your development environment:**
    *   If working within Firebase Studio (Project IDX), the root `.idx/dev.nix` file provides a pre-configured environment with tools like `google-clasp`, `nodejs`, `go` (for `contextvibes`), etc.
    *   Ensure you have `google-clasp` installed and authenticated if working locally outside IDX.
3.  **Make your changes:**
    *   Adhere to the coding style and conventions used in the project (see "Coding Standards" below).
    *   If adding a new template, follow the structure of existing templates (include a `README.md`, `src/appsscript.json`, `.idx/dev.nix`, `.idx/airules.md`, etc.).
    *   Ensure any new template is registered in the root `idx-template.json` and that `idx-template.nix` can correctly bootstrap it.
    *   Update documentation (READMEs, comments) as needed.
4.  **Test your changes thoroughly.** (See "Testing" below).
5.  **Commit your changes:** Use clear and descriptive commit messages. Consider following conventional commit formats if you're comfortable (e.g., `feat: Add new template for X`, `fix: Correct issue in Y module`).
6.  **Open a Pull Request:**
    *   Ensure your PR clearly describes the problem and solution. Include the relevant issue number if applicable.
    *   Provide details on how to test your changes.

## Development Workflow & Coding Standards

*   **Google Apps Script (GAS):**
    *   Use the V8 runtime (`"runtimeVersion": "V8"` in `appsscript.json`).
    *   Follow modern JavaScript (ES6+) best practices where supported by GAS V8.
    *   **Modularity:** Employ factory functions (Crockford-style) for creating service modules. Avoid `class` syntax for core GAS logic unless there's a compelling reason and it's well-encapsulated.
    *   **Global Scope:** Understand that all server-side `.js` files in `src/` share a single global scope. Do not use `require()` or ES6 `import`/`export`.
    *   **Clarity:** Use descriptive variable and function names.
    *   **Comments:** Write JSDoc comments for all functions, explaining their purpose, parameters, and return values. Comment complex logic.
    *   **Error Handling:** Implement robust error handling using `try...catch` blocks, and consider using or extending the `ErrorManager` pattern seen in some templates.
    *   **`clasp`:** Use `clasp` for local development and pushing changes to Google Apps Script. Ensure `rootDir` in `.clasp.json` is set correctly (usually to `src`).
*   **Nix Environments (`.idx/dev.nix`):**
    *   Define the minimal necessary packages for both the template collection development (root `dev.nix`) and for end-users of each specific template (template-level `dev.nix`).
*   **AI Rules (`.idx/airules.md`):**
    *   When creating or updating AI rules for a template, ensure they are tailored to the template's specific use case and provide genuinely helpful guidance for an end-user. Follow THEA principles for prompt design.
*   **Documentation (`README.md`):**
    *   All templates MUST have a clear `README.md` explaining their purpose, setup, usage, and key features.
    *   The root `README.md` should provide an overview of the collection.
*   **Linters/Formatters:** While not strictly enforced by CI yet, consider using Prettier and ESLint for consistent code style (example configurations might be added to templates like the API Connector).

## Testing

*   **Manual Testing:** For GAS projects, thorough manual testing is crucial.
    *   Push your code using `clasp push`.
    *   Test all functionalities in the relevant Google Workspace application (Sheets, Docs, Web App URL, etc.).
    *   Check Apps Script dashboard logs for errors.
    *   Test different scenarios and edge cases.
*   **Conceptual Validation (for AI Rules & Structure):**
    *   When modifying AI rules or project structure, use `bin/contextvibes describe` to get a snapshot and conceptually validate that the AI assistance will be effective and the structure is sound.

## Questions?

Feel free to open an issue if you have questions about contributing.

Thank you for contributing to this project!