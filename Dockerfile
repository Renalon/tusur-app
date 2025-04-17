# Используем официальное изображение Python
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы с локальной машины в контейнер
COPY requirements.txt /app/

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем все файлы приложения в контейнер
COPY . /app/

# Открываем порт для приложения
EXPOSE 5000

# Запускаем приложение через Gunicorn (для продакшн-среды)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]