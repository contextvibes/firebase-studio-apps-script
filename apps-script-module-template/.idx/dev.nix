# .idx/dev.nix
#
# This file declaratively defines the complete, reproducible development
# environment for this project using Nix, tailored for Project IDX.
# It ensures that all developers and CI/CD systems use the exact same tools.
#
# For more information, see the IDX documentation:
# https://firebase.google.com/docs/studio/devnix-reference

{ pkgs, ... }:

let
  # Import a custom Nix derivation for our project-specific CLI tool.
  # This idiomatic Nix approach builds the tool as a reproducible package,
  # which is more robust than using an imperative install script.
  contextvibes = import ./contextvibes.nix { pkgs = pkgs; };
in
{
  # -----------------------------------------------------------------------------
  # NIXPKGS CHANNEL
  # -----------------------------------------------------------------------------
  # Pin to a specific stable Nixpkgs channel. This is the most critical
  # part of ensuring reproducibility. It guarantees that all enumerated packages
  # are installed at the exact same versions for every user of this environment.
  channel = "stable-25.05"; # For the latest, see https://nixos.org/channels/

  # -----------------------------------------------------------------------------
  # ENVIRONMENT PACKAGES
  # -----------------------------------------------------------------------------
  # System-level packages available in the workspace terminal.
  # Packages are found on the Nix Package Search: https://search.nixos.org/packages
  packages = [
    # --- Code Quality & Formatting ---
    pkgs.nodejs_22 # Required by markdownlint-cli.

    # --- Version Control & CLI Utilities ---
    pkgs.file # Determines file types.
    pkgs.git  # The industry-standard distributed version control system.
    pkgs.jq   # A command-line processor for JSON, essential for scripting.
    pkgs.tree # Displays directory structures in a tree-like format.

    # --- Project-Specific Tooling ---
    contextvibes # The custom 'contextvibes' CLI tool built from ./contextvibes.nix.
  ];

  # -----------------------------------------------------------------------------
  # ENVIRONMENT VARIABLES
  # -----------------------------------------------------------------------------
  # Global environment variables for the workspace.
  env = { };

  # -----------------------------------------------------------------------------
  # PROJECT IDX CONFIGURATION
  # -----------------------------------------------------------------------------
  # This section configures Project IDX-specific features.
  idx = {
    # VS Code extensions to install from the Open VSX Registry.
    # Find extensions at: https://open-vsx.org/
    extensions = [
      # --- Version Control ---
      "GitHub.vscode-pull-request-github" # Integrates GitHub pull requests and issues.

      # --- Linters & Formatters ---
      "dbaeumer.vscode-eslint"   # Integrates ESLint into VS Code.
      "esbenp.prettier-vscode" # Provides Prettier code formatting.
    ];

    workspace = {
      # Runs ONCE when the workspace is first created.
      onCreate = { };

      # Runs EVERY time the workspace starts.
      onStart = {
        # Ensure a convenient 'clasp' alias is available in the shell.
        # This script idempotently adds the alias to ~/.bash_aliases.
        add-clasp-alias = ''
          if ! grep -q "alias clasp=" ~/.bash_aliases 2>/dev/null; then
            echo 'alias clasp="npx @google/clasp"' >> ~/.bash_aliases
            echo "✅ Added 'clasp' alias. Please open a new terminal to use it."
          fi
        '';
      };
    };

    # This project is a library and backend service, so the IDX web preview
    # feature is not needed.
    previews = {
      enable = false;
    };
  };
}
