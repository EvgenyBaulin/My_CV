#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="my-cv-builder"
CONTAINER_NAME="cv-builder-temp"
WORKDIR="/app"             # ДОЛЖЕН совпадать с WORKDIR в Dockerfile
HOST_OUT="$(pwd)/_artifacts"     # временная папка на хосте

rm -rf "$HOST_OUT"; mkdir -p "$HOST_OUT"

# Собираем образ (внутри него будет TeX Live и твои .tex + build.sh)
docker build -t "$IMAGE_NAME" -f Dockerfile .

# Создаём контейнер из образа и запускаем сборку (внутри контейнера появится /workspace/output)
docker run --name "$CONTAINER_NAME" "$IMAGE_NAME" bash -lc "cd '$WORKDIR' && chmod +x build.sh && ./build.sh"

# Копируем готовые PDF наружу (ИМЕННО из /workspace/output, а не /app/output)
docker cp "$CONTAINER_NAME:$WORKDIR/output/." "$HOST_OUT/"
docker rm -f "$CONTAINER_NAME"

# Переименовываем файлы уже на хосте (как требуется)
mv "$HOST_OUT/CV_Evgeny_Baulin_Full_Stack_Developer.pdf" "CV. Evgeny Baulin. Full Stack Developer.pdf"
mv "$HOST_OUT/CV_Evgeny_Baulin_Programmer_Analyst.pdf"   "CV. Evgeny Baulin. Programmer Analyst.pdf"
mv "$HOST_OUT/CV_Evgeny_Baulin_Eng.pdf"                  "CV Evgeny Baulin.pdf"
mv "$HOST_OUT/CV_Evgeny_Baulin_Rus.pdf"                  "Резюме Евгений Баулин.pdf"

rm -rf "$HOST_OUT"
echo "run.sh: артефакты переименованы и готовы в корне репо"
