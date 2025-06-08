# .idx/dev.nix
# IDX environment configuration for Google Apps Script (GAS) Development
# using clasp and JavaScript, and also supporting contextvibes CLI development.
{ pkgs, ... }: {
  # Pin to a specific Nixpkgs channel for reproducibility.
  channel = "stable-25.05"; # Good practice

  # The 'pkgs' block defines system-level packages available in your workspace.
  packages = with pkgs; [
    # --- Core Go Development & contextvibes ---
    go # Required by contextvibes and for its development
    wget # For fetching thea-manifest.json

    # --- Core Apps Script & JS Tooling ---
    nodejs_20 # A recent LTS version of Node.js, which includes npm.
    # `clasp` is installed via npx in onCreate, so not strictly needed here unless you want a system-wide version.
    # If `npx @google/clasp` is preferred, keep it out of pkgs to avoid potential version conflicts.

    # --- Version Control & GitHub Integration ---
    git # Essential for version control.
    gh # The official GitHub CLI.

    # --- Utilities ---
    tree # Useful for viewing directory structures.
  ];

  # The 'env' block sets environment variables for the entire workspace.
  env = {
    # Example: Set a global GOPATH or GOBIN if needed by other tools,
    # though for 'go install' to ./bin, GOBIN is set temporarily in the script.
    # MY_GLOBAL_VAR = "some_value";
  };

  # IDX-specific settings
  idx = {
    # VS Code extensions that will be automatically installed.
    extensions = [
      "dbaeumer.vscode-eslint"
      "esbenp.prettier-vscode"
      "GitHub.vscode-pull-request-github"
    ];

    previews = {
      enable = false; # Fine if no web previews are needed for this project
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs only once when the workspace is first created.
      onCreate = {
        # Guide the user to a README file for manual setup steps.
        # Renamed key for clarity
        initial-setup-guide = "echo '✅ Workspace created! Please see the README.md for any further manual setup instructions.'";

        # Installs clasp using npx - this gets a specific version and doesn't require it in pkgs.Good.
        install-clasp = "echo 'Installing @google/clasp globally using npm...'; npm install -g @google/clasp@3.0.6-alpha";

        # Installs contextvibes CLI into a local ./bin directory.
        install-contextvibes-cli = ''
          echo "⏳ Installing contextvibes CLI into ./bin..."
          LOCAL_BIN_DIR="$(pwd)/bin" # pwd here is /workspace/your-project-name
          mkdir -p "$LOCAL_BIN_DIR"
          
          # Temporarily set GOBIN for this command only
          if GOBIN="$LOCAL_BIN_DIR" go install github.com/contextvibes/cli/cmd/contextvibes@latest; then
            echo "✅ Successfully installed contextvibes to $LOCAL_BIN_DIR"
            echo "   Make sure to run 'source .idx/dev.nix' or restart workspace for PATH changes in onStart to take effect if this is the very first creation."
          else
            echo "❌ ERROR: Failed to install contextvibes. Check Go setup and network."
          fi
          # GOBIN is unset automatically as it was set only for that command's environment.
        '';
      };

      # Runs every time the workspace starts.
      onStart = {
        # Combined startup script
        startup-script = ''
                    echo "-----------------------------------------------------"
                    echo "🚀 ContextVibes & Apps Script Workspace Initializing..."
                    echo "-----------------------------------------------------"
          
                    echo "[1/4] 👋 Welcome back! Checking tool versions..."
                    if command -v go &> /dev/null; then echo "Go version: $(go version)"; else echo "Go not found"; fi
                    if command -v git &> /dev/null; then echo "Git version: $(git --version)"; else echo "Git not found"; fi
                    if command -v node &> /dev/null; then echo "Node version: $(node --version)"; else echo "Node.js not found"; fi
                    if command -v clasp &> /dev/null; then echo "Clasp version: $(clasp --version)"; else echo "Clasp not found (may be installed via npx)"; fi
                    if command -v contextvibes &> /dev/null; then echo "ContextVibes version: $(contextvibes version)"; else echo "ContextVibes (from ./bin) not yet on PATH or not installed."; fi
                    echo "-----------------------------------------------------"

                    echo "[2/4] 🔧 Adding local ./bin to PATH..."
                    # pwd here is /workspace/your-project-name (e.g. /workspace/cli)
                    LOCAL_CLI_BIN_DIR="$(pwd)/bin" 
                    # Check if $LOCAL_CLI_BIN_DIR is already in PATH to avoid duplicates
                    if [[ ":$PATH:" != *":$LOCAL_CLI_BIN_DIR:"* ]]; then
                      if [ -d "$LOCAL_CLI_BIN_DIR" ]; then
                        export PATH="$LOCAL_CLI_BIN_DIR:$PATH"
                        echo "✔️  Local CLI ./bin directory added to PATH."
                      else
                        echo "⚠️  Local CLI ./bin directory ($LOCAL_CLI_BIN_DIR) not found at startup, not added to PATH."
                      fi
                    else
                      echo "✔️  Local CLI ./bin directory already in PATH."
                    fi
                    # echo "Current PATH: $PATH" # Optional: for debugging PATH issues

                    echo "-----------------------------------------------------"
                    echo "[3/4] 🔄 Ensuring local copy of thea-manifest.json is up-to-date..."
                    # Define the target directory *within the current project*
                    # pwd here is /workspace/your-project-name (e.g., /workspace/cli)
                    LOCAL_THEA_MANIFEST_DIR="$(pwd)/THEA" # Target: ./THEA/
                    mkdir -p "$LOCAL_THEA_MANIFEST_DIR" # Ensure the target directory exists

                    MANIFEST_URL="https://raw.githubusercontent.com/contextvibes/THEA/main/thea-manifest.json"
                    OUTPUT_FILE="$LOCAL_THEA_MANIFEST_DIR/thea-manifest.json"

                    echo "   Fetching from: $MANIFEST_URL"
                    echo "   Saving to:     $OUTPUT_FILE"
          
                    # Use wget to download directly to the target location, overwriting.
                    # -O specifies output file.
                    # Adding --timeout and --tries for robustness.
                    if wget --timeout=15 --tries=2 -O "$OUTPUT_FILE.tmp" "$MANIFEST_URL" > /dev/null 2>&1; then
                      # On success, move temp file to final destination
                      if mv "$OUTPUT_FILE.tmp" "$OUTPUT_FILE"; then
                        echo "✔️  Latest thea-manifest.json fetched and saved to $OUTPUT_FILE"
                      else
                        echo "❌ ERROR: Failed to move temporary manifest to $OUTPUT_FILE."
                        rm -f "$OUTPUT_FILE.tmp" # Clean up temp file on move failure
                      fi
                    else
                      echo "❌ ERROR: Failed to fetch thea-manifest.json from $MANIFEST_URL."
                      echo "         Please check network connectivity and the URL."
                      # Temp file might not exist or might be incomplete if wget failed, 
                      # but attempt cleanup just in case.
                      rm -f "$OUTPUT_FILE.tmp" 
                    fi
          
                    echo "-----------------------------------------------------"
                    echo "[4/4] 🎉 Workspace setup complete!"
                    echo "-----------------------------------------------------"
        ''; # End of the multi-line shell script
      }; # End of onStart
    }; # End of workspace
  }; # End of idx
}
