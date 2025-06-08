Sparky's Tooling & Environment Guide
Document Owner: Sparky
Version: 1.0

1. Objective
This guide serves as the central playbook for the development environment and primary command-line tools used in this Google Apps Script project. It provides a high-level overview of each tool's purpose and links to detailed "how-to" guides for specific, complex procedures.

2. Core Philosophy
Our development environment, managed by Sparky, prioritizes consistency, security, and efficiency. All tools are configured to work seamlessly within the Firebase Studio environment.

3. Primary Toolchain
3.1. clasp (Google Apps Script CLI)
Purpose: clasp is the official command-line tool for creating, managing, and deploying Google Apps Script projects. We use it to sync our local code in Firebase Studio with the Apps Script platform.

Key Operations:

Authenticating the CLI with your Google account.

Creating new Apps Script projects.

Pushing local code to a project.

Deploying new versions of an application.

Detailed Guides:

How-To: Authenticate clasp in Firebase Studio

3.2. npm (Node Package Manager)
Purpose: npm is used to manage project dependencies, specifically for development tools like clasp itself and any other packages required for our build or linting processes.

Key Operations:

Installing all project dependencies (npm install).

Adding new development dependencies (npm install --save-dev [package-name]).

Detailed Guides:

(Placeholder: Link to a future how-to guide, e.g., docs/how-to/manage-npm-dependencies.md)