# Fuzzy Cognitive Maps tutorial

This tutorial is part of the course Fuzzy Sets and Systems for the [Swiss Joint Master of Science in Computer Science](https://mcs.unibnf.ch/). It introduces the use of fuzzy logic algorithms in Python, utilizing the [fcmpy](https://github.com/SamvelMK/FCMpy) library.

The tutorial instructions are based on examples provided by the `fcmpy` library.

## Requirements

Python version 3.8 or Docker. The Python versions 3.9 and later ones may cause some dependencies issues and are not yet fully supported by the `fcmpy` package.
However, the main functions of the package _should_ work with versions 3.9, 3.10 and 3.11.

## Installation

> [!NOTE]
> This guide assists in setting up JupyterLab and Python dependencies. 
> If you're already comfortable with Python, feel free to use your preferred setup process.


### With conda

1. Verify your Python version:

```bash
python3 --version
```

2. Create a conda environment
Change `<venv>` to your desired name.

```bash
conda create --name venv python=3.8
```

3. **Activate** the virtual environment:
```bash
conda activate venv
```

4. Install libraries
```bash
pip install -r requirements.txt
pip install jupyterlab
```

5. Create a kernel for the jupyter notebook
```bash
python -m ipykernel install --user --name=venv --display-name "venv"
```

6. **Start Jupyter Lab**
```bash
jupyter lab
```
This command should open a local web interface (or display a URL) for JupyterLab, where you can access the tutorial notebooks.

### With Docker

If you encounter issues with the setup above, you can use [Docker](https://docs.docker.com/get-docker/) to run the environment.

1. **Build** the Docker image

This command will build a Docker image and install the necessary libraries:

```bash
docker build -t fcm-notebook:latest .
```

2. **Run** the Docker container:

Use the following command to start the JupyterLab server in a Docker container:

```bash
docker run -it --rm -p 8888:8888 -v "${PWD}":/workspace fcm-notebook:latest
```

If you are on Windows (without WSL), replace `"${PWD}"` with `%cd%`.

3. **Access** JupyterLab:

Click on the link that looks like `http://127.0.0.1:8888/lab?token=YOUR_TOKEN` in the terminal output.


## Tutorials
This course includes two tutorial notebooks:
* **01_FCM_Scenario.ipynb**: Introduction to Fuzzy Cognitive Maps - Scenarios
* **02_FCM_ClassImportance.ipynb** Introduction to Fuzzy Cognitive Maps - Class importance

Work through these notebooks in order.

## Deliverable

After completing the tutorials, create your own Jupyter notebook applying one of the approaches to a problem.

1. **Select a domain**: choose a domain related to your group project (if already available) or a personal interest.
2. **Create and name your notebook**: experiment with the chosen approach and save your notebook as `03_<YourProjectName>.ipynb`.
3. **Push to your repository**: upload your completed notebook to your GitHub repository **(including the output)**.