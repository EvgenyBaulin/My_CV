#!/usr/bin/env bash

set -e

IMAGE_NAME="my-cv-builder"
CONTAINER_NAME="cv-builder-temp"
OUTPUT_DIR="./pdf"

docker build -t "$IMAGE_NAME" -f Dockerfile .

docker run --name "$CONTAINER_NAME" "$IMAGE_NAME"

mkdir -p "$OUTPUT_DIR"
docker cp "$CONTAINER_NAME:/app/output" "$OUTPUT_DIR"

docker rm "$CONTAINER_NAME"

mv "pdf/output/CV. Evgeny Baulin. Full Stack Developer.pdf" "CV. Evgeny Baulin. Full Stack Developer.pdf"
mv "pdf/output/CV. Evgeny Baulin. Programmer Analyst.pdf" "CV. Evgeny Baulin. Programmer Analyst.pdf"

rm -r pdf
