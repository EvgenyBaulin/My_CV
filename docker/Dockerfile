FROM texlive/texlive:latest

# Установим рабочую директорию
WORKDIR /app

# Копируем весь репозиторий в контейнер
COPY . /app

# На всякий случай установим дополнительные пакеты, если нужно
RUN apt-get update && apt-get install -y \
    lmodern \
    && rm -rf /var/lib/apt/lists/*

# Делаем скрипт сборки исполняемым
RUN chmod +x docker/build.sh

# Запускаем скрипт сборки
RUN ./docker/build.sh
