# IDX environment configuration for Google Apps Script Development using clasp
{ pkgs, ... }: {
  channel = "stable-25.05";

    packages = with pkgs; [
    # --- Core Development & Workflow ---
    go
    google-clasp
    nodejs

    git
    
    # --- Utilities --
    gh
    tree # Directory structure viewer
    nodePackages.markdownlint-cli
  ];
  


  # Configure environment
  env = { };

  # IDX specific settings
  idx = {
    extensions = [
      "dbaeumer.vscode-eslint"
      "esbenp.prettier-vscode"
      "GitHub.vscode-pull-request-github"
    ];
    previews = { enable = false; };

    workspace = {
      onCreate = {
        # Guide the user to the SETUP file first
        setup-reminder = "echo 'Workspace created. Start the setup using the Gemini chat'";
        installContextVibesCli = ''
          echo "Attempting to install contextvibes CLI into ./bin ..."

          if ! command -v go &> /dev/null
          then
              echo "Go command could not be found, skipping contextvibes installation."
              # Exit gracefully or 'exit 1' if critical
              # For now, we'll assume Go is present due to pkgs.go
          else
            LOCAL_BIN_DIR="$(pwd)/bin"
            mkdir -p "$LOCAL_BIN_DIR"
            echo "Target directory for contextvibes: $LOCAL_BIN_DIR"

            export GOBIN="$LOCAL_BIN_DIR"
            echo "Running: GOBIN=$GOBIN go install github.com/contextvibes/cli/cmd/contextvibes@latest"

            if go install github.com/contextvibes/cli/cmd/contextvibes@latest; then
              echo "Successfully installed contextvibes to $LOCAL_BIN_DIR/contextvibes"
              echo "You can run it using: $LOCAL_BIN_DIR/contextvibes"
              echo "Consider adding '$LOCAL_BIN_DIR' to your PATH for convenience (see README)."
              chmod +x "$LOCAL_BIN_DIR/contextvibes" || echo "Note: chmod +x on contextvibes failed."
            else
              echo "ERROR: Failed to install contextvibes."
            fi
            unset GOBIN
          fi
        '';
      };

      # Runs every time the workspace starts
      onStart = { };
    };
  };
}
