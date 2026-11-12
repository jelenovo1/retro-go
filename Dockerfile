FROM espressif/idf:release-v5.0

WORKDIR /app

ADD . /app

# Apply patches
RUN cd /opt/esp/idf && \
    patch --ignore-whitespace -p1 -i "/app/tools/patches/panic-hook (esp-idf 5).diff"

# Build
SHELL ["/bin/bash", "-c"]
RUN . /opt/esp/idf/export.sh && \
    python3 rg_tool.py --target=esp32-s3-devkit release
