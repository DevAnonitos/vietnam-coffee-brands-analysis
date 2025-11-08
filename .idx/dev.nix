# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-25.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.python312
    pkgs.python312Packages.pip
    pkgs.python312Packages.setuptools
    pkgs.python312Packages.virtualenv
    pkgs.python312Packages.wheel
    pkgs.git
    pkgs.curl
    pkgs.wget
    pkgs.unzip
    pkgs.jq
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
      "esbenp.prettier-vscode"
      "GitHub.vscode-pull-request-github"
      "ms-python.debugpy"
      "ms-python.python"
      "ms-toolsai.jupyter"
      "ms-toolsai.jupyter-keymap"
      "ms-toolsai.jupyter-renderers"
      "ms-toolsai.vscode-jupyter-cell-tags"
      "ms-toolsai.vscode-jupyter-slideshow"
      "bungcip.better-toml"
      "redhat.vscode-yaml"
      "remcohaszing.schemastore"
      "EricSia.pythonsnippets3"
      "mechatroner.rainbow-csv"
      "ms-azuretools.vscode-containers"
      "ms-azuretools.vscode-docker"
      "ms-python.isort"
      "ms-python.pylint"
      "njpwerner.autodocstring"
      "ms-toolsai.vscode-jupyter-powertoys"
      "janisdd.vscode-edit-csv"
      "charliermarsh.ruff"
      "ms-python.black-formatter"
      "ms-vscode.live-server"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        setup-python = ''
          echo "🚀 Initializing Python virtual environment..."
          if [ ! -d ".venv" ]; then
            python -m venv .venv
            echo "✅ Virtual environment created."
          fi

          source .venv/bin/activate

          # If requirements.txt exists, install dependencies
          if [ -f "requirements.txt" ]; then
            echo "📦 Installing dependencies from requirements.txt..."
            pip install --upgrade pip setuptools wheel
            pip install -r requirements.txt || echo "⚠️ Some packages failed to install. Please check manually."
          else
            echo "ℹ️ No requirements.txt found, skipping pip install."
          fi
        '';
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
      # Runs when the workspace is (re)started
      onStart = {
        activate-venv = ''
          if [ -d ".venv" ]; then
            source .venv/bin/activate
            echo "🐍 Virtual environment activated."
          else
            echo "⚠️ No .venv found, run setup-python manually."
          fi
        '';
      };
    };
  };
}
