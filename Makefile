PYTHON = python3
VENV = .venv
ACTIVATE = source $(VENV)/bin/activate

setup:
	@echo "Setting up environment..."
	$(PYTHON) -m venv $(VENV)
	$(ACTIVATE) && pip install --upgrade pip setuptools wheel
	$(ACTIVATE) && pip install -r requirements.txt
	@echo "Environment setup complete."

format:
	@echo "Formatting code..."
	$(ACTIVATE) && black .
	$(ACTIVATE) && isort .
	$(ACTIVATE) && ruff check . --fix
	@echo "Code formatted successfully."

lint:
	@echo "Linting code..."
	$(ACTIVATE) && ruff check .
	@echo "Lint complete."
