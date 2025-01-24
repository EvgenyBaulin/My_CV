FROM texlive/texlive:latest


WORKDIR /app

COPY . /app

# Устанавливаем зависимости (при необходимости)
RUN apt-get update && apt-get install -y \
    lmodern \
    && rm -rf /var/lib/apt/lists/*

# Права на выполнение: теперь путь к build.sh — /app/build.sh
RUN chmod +x /app/build.sh

# Запускаем скрипт
RUN /app/build.sh
