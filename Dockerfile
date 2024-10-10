# Етап 1: Збірка
FROM python:3.8-slim AS builder

WORKDIR /app

# Встановлення залежностей
COPY requirements.txt .
RUN pip install -r requirements.txt

# Копіювання виходу програми
COPY . .

# Етап 2: Фінальний образ
FROM python:3.8-slim

WORKDIR /app

# Копіювання залежностей з попереднього етапу
COPY --from=builder /app .

# Вказуємо команду для запуску
CMD ["python", "GraphAnalysis.py", "obj_dependency_data.csv"]

