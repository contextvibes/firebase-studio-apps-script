# Google Apps Script Kickstart for Firebase Studio
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE) [![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](CONTRIBUTING.md) [![Clasp](https://img.shields.io/badge/clasp-v3.0.6--alpha-brightgreen.svg)](https://github.com/google/clasp)

Supercharge your Google Apps Script (GAS) development with this collection of starter templates, designed for seamless integration with **Firebase Studio (Project IDX)**. Whether you're a beginner taking your first steps in GAS or an experienced developer building sophisticated automations, this collection provides well-structured, best-practice foundations to accelerate your projects.

<a href="https://studio.firebase.google.com/new?template=https://github.com/contextvibes/firebase-studio-apps-script">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="https://cdn.firebasestudio.dev/btn/open_dark_32.svg">
    <source
      media="(prefers-color-scheme: light)"
      srcset="https://cdn.firebasestudio.dev/btn/open_light_32.svg">
    <img
      height="32"
      alt="Open in Firebase Studio"
      src="https://cdn.firebasestudio.dev/btn/open_blue_32.svg">
  </picture>
</a>

## Our Vision

To empower developers by providing a comprehensive suite of high-quality, production-ready Google Apps Script templates. Each template is crafted to:
*   **Integrate seamlessly with Firebase Studio**, utilizing Nix for reproducible development environments.
*   **Promote best practices** for GAS development, including modularity, maintainability, and robust error handling.
*   **Accelerate project bootstrapping**, allowing you to focus on unique application logic rather than boilerplate setup.
*   **Include embedded AI guidance** (via `.idx/airules.md`) within each template to further support the development process.

## Available Templates

This collection currently offers the following templates. Choose the one that best fits your project needs when launching a new workspace in Firebase Studio:

1.  **Starter Template (`apps-script-starter-template`)**
    *   **Description:** The perfect starting point for beginners or for very simple, single-file scripts. Provides a minimal, bare-bones structure with examples of a basic `Logger.log` function and a Google Sheets custom function.
    *   **Ideal for:** Learning GAS, quick utilities, simple custom functions.
    *   **Location:** [`./apps-script-starter-template/`](./apps-script-starter-template/)
    *   **Key Features:** Single `Code.js` file, basic `appsscript.json`, `clasp` setup.

2.  **Modular Web App Template (`apps-script-module-template`)**
    *   **Description:** A foundational template for building Google Apps Script web applications with a clean, modular structure (inspired by Crockford-style factory functions). Includes examples for client-server communication, basic UI with `index.html`, and service modules for common tasks like error and time management.
    *   **Ideal for:** Web applications, projects requiring separation of concerns, intermediate GAS development.
    *   **Location:** [`./apps-script-module-template/`](./apps-script-module-template/)
    *   **Key Features:** `webapp.js` for server logic, `index.html` for UI, `src/modules/` for reusable services, `clasp` setup.

3.  **API Connector Template (`apps-script-api-connector-template`)**
    *   **Description:** A robust framework for scripts that need to connect to external (non-Google) APIs, fetch data, transform it, and sync it to Google Sheets. Demonstrates best practices for API authentication (handling secrets), `UrlFetchApp` usage, error handling, data mapping, and scheduling regular syncs.
    *   **Ideal for:** Integrating third-party services, data warehousing in Sheets, building custom data pipelines.
    *   **Location:** [`./apps-script-api-connector-template/`](./apps-script-api-connector-template/)
    *   **Key Features:** Modules for API connection, authentication, data transformation, Sheet syncing, scheduled execution, `clasp` setup.

*(Explore each template's dedicated `README.md` for detailed setup and usage instructions.)*

## How to Use with Firebase Studio

1.  **Click the "Open in Firebase Studio" button above** (recommended).
2.  Firebase Studio will detect the root `idx-template.json` and `idx-template.nix` files.
3.  You will be prompted to **select one of the available templates** (Starter, Modular Web App, or API Connector) from a dropdown menu.
4.  Firebase Studio will then bootstrap your new workspace by copying the selected template's entire directory (e.g., `apps-script-starter-template/`) into your workspace.

Each template comes with its own pre-configured Nix environment (`.idx/dev.nix`) providing necessary tools like `clasp`, and its own AI assistance rules (`.idx/airules.md`) tailored to its specific use case.

## Contributing

We enthusiastically welcome contributions! Whether it's proposing a new template, enhancing an existing one, improving documentation, or refining the Nix environments, your input is valuable.

Please read our [**Contributing Guidelines (`CONTRIBUTING.md`)**](CONTRIBUTING.md) for detailed information on how to get started, our development workflow, and coding standards.

## Code of Conduct

Be kind

## Roadmap

We're always looking to expand and improve this collection! Future ideas include:
*   [ ] Template for Google Workspace Add-ons (e.g., Sheets, Docs, Gmail).
*   [ ] Advanced standalone automation engine with more sophisticated trigger management and logging.
*   [ ] Examples of using popular Apps Script libraries.
*   [ ] Enhanced testing frameworks or guidance for GAS.

Have an idea for a template or an improvement? Please [open an issue](https://github.com/duizendstra/gas-template-tmp/issues) or see our [Contributing Guidelines](CONTRIBUTING.md).

## License

This project and its templates are licensed under the MIT License. See the [LICENSE](LICENSE) file for details.