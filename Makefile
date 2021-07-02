# The top directory where environment will be created.
TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

# A pip `requirements.txt` file.
#https://pip.pypa.io/en/stable/reference/pip_install/#requirements-file-format
REQUIREMENTS_FILE := requirements.txt

# A conda `environment.yml` file.
# https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
ENVIRONMENT_FILE := environment.yml

include third_party/make-env/conda.mk

# Example make target which runs commands inside the conda environment.
test-command: | $(CONDA_ENV_PYTHON)
	@$(IN_CONDA_ENV) pip install -r docs/requirements.txt 
	@$(IN_CONDA_ENV) make -C docs livehtml
