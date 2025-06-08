# IDX environment configuration for Google Apps Script (GAS) Development
# using clasp and JavaScript.
{ pkgs, ... }: {
  # Pin to a specific Nixpkgs channel for reproducibility.
  channel = "stable-25.05";

  # The 'pkgs' block defines system-level packages available in your workspace.
  packages = with pkgs; [
    # --- Core Apps Script & JS Tooling ---
    nodejs_20 # A recent LTS version of Node.js, which includes npm.

    # --- Version Control & GitHub Integration ---
    git # Essential for version control.
    gh # The official GitHub CLI.

    # --- Utilities ---
    go # Required by the custom `contextvibes` installation script.
    tree # Useful for viewing directory structures.
  ];

  # The 'env' block sets environment variables for the entire workspace.
  env = { };

  # IDX-specific settings
  idx = {
    # VS Code extensions that will be automatically installed.
    extensions = [
      "dbaeumer.vscode-eslint"
      "esbenp.prettier-vscode"
      "dev-tools-for-apps-script.vscode-clasp"
      "GitHub.vscode-pull-request-github"
    ];

    previews = { enable = false; };

    # Workspace lifecycle hooks
    workspace = {
      # Runs only once when the workspace is first created.
      onCreate = {
        # Guide the user to a README file for manual setup steps.
        setup-guide = "echo '✅ Workspace created! Please see the README.md for setup instructions.'";
        installClasp = "npx @google/clasp@3.0.6-alpha";

        # Your custom script to install a Go-based CLI into a local ./bin directory.
        installContextVibesCli = ''
          echo "Installing contextvibes CLI into ./bin..."
          LOCAL_BIN_DIR="$(pwd)/bin"
          mkdir -p "$LOCAL_BIN_DIR"
          export GOBIN="$LOCAL_BIN_DIR"
          if go install github.com/contextvibes/cli/cmd/contextvibes@latest; then
            echo "✅ Successfully installed contextvibes to $LOCAL_BIN_DIR"
          else
            echo "❌ ERROR: Failed to install contextvibes."
          fi
          unset GOBIN
        '';
      };

      # Runs every time the workspace starts.
      onStart = {
        # Welcome message and version checks for quick diagnostics.
        welcome = "echo '👋 Welcome back! Checking tool versions...'; node --version; clasp --version;";

        # Add the local ./bin directory (if it exists) to the PATH.
        add-local-bin-to-path = ''
          LOCAL_BIN_DIR="$(pwd)/bin"
          if [ -d "$LOCAL_BIN_DIR" ]; then
            export PATH="$LOCAL_BIN_DIR:$PATH"
            echo "✔️  Local ./bin directory added to PATH."
          fi
        '';
      };
    };
  };
}
