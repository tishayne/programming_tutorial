FROM python:3.8-slim

ARG UV_VERSION=0.5.31
ARG JUPYTER_VERSION=4.3.5

# Install curl and certificates for uv installer
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    pkg-config \
    libhdf5-dev \
    gcc \
    g++ \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Download specific version of uv installer
RUN curl -L -o /uv-installer.sh https://astral.sh/uv/${UV_VERSION}/install.sh && \
    sh /uv-installer.sh && \
    rm /uv-installer.sh

ENV PATH="/root/.local/bin/:$PATH"

# Create non-root user and workspace directory
RUN useradd -m jupyter && \
    mkdir -p /workspace && \
    chown jupyter:jupyter /workspace

# Set up environment
WORKDIR /workspace
COPY requirements.txt /tmp/

# Install Python dependencies using uv
RUN uv pip install --system \
    "jupyterlab==${JUPYTER_VERSION}" \
    -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

USER jupyter

# Expose JupyterLab port
EXPOSE 8888

# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]