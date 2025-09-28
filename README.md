# integration-module
Задачи ДЭ
<img src='./img/Основные задачи ДЭ.PNG' alt='example-de' />

> Задача №1
# Подсистема работы с партнерами компании

## Описание проекта
Компания занимается производством и реализует свою продукцию через партнеров, которые доставляют продукцию компании до конечных потребителей. Для эффективного взаимодействия с партнерами и контроля их работы требуется система, позволяющая обрабатывать всю информацию в цифровом формате.

## Функционал подсистемы
- Просмотр списка партнеров
- Добавление/редактирование данных о партнере
- Просмотр истории реализации продукции партнером

## Технические требования

### База данных
- Реализация в выбранной СУБД
- Соответствие 3 нормальной форме
- Обеспечение ссылочной целостности
- Согласованная схема именования
- Создание первичных и внешних ключей

### Сущности системы
На данном этапе достаточно создать таблицы, поля с подходящими типами данных и связи, непосредственно относящиеся к разрабатываемой подсистеме.

## Выходные артефакты

### ER-диаграмма
- Формат: PDF
- Содержание: таблицы, связи между ними, атрибуты и ключи
- Примечание: типами данных можно пренебречь

### Импорт данных
- Подготовка данных из файлов заказчика (с пометкой import)
- Загрузка данных в разработанную базу данных

### Скрипт базы данных
- Создание скрипта БД
- Сохранение полученных результатов

## Приложения
**Приложение 1**: Описание предметной области

# Установка MySQL

## Скачивание MySQL Community Server

1. Откройте сайт: [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)

2. В разделе "MySQL Community (GPL) Downloads" нажмите "MySQL Community Server"

3. Выберите параметры скачивания:
   - **Operating System**: Microsoft Windows
   - **Version**: MySQL Installer (самый первый в списке)

4. Скачайте файл: `mysql-installer-community-8.0.xx.x.msi`

# Выбор типа установки MySQL

## Доступные варианты конфигурации:

### Development Computer
- **Назначение**: для разработки
- **Ресурсы**: минимальные требования
- **Рекомендации**: для локальной разработки и тестирования

### Server Computer
- **Назначение**: для сервера
- **Ресурсы**: средние требования
- **Рекомендации**: для рабочих серверов с умеренной нагрузкой

### Dedicated Computer
- **Назначение**: выделенный сервер
- **Ресурсы**: максимальные требования
- **Рекомендации**: для высоконагруженных продакшен-серверов

### Создаём пароль (запоминаем его!)
- Нажмите Execute

# Установка MySQL Workbench

## Скачивание MySQL Workbench

1. Перейдите на официальный сайт: [https://dev.mysql.com/downloads/workbench/](https://dev.mysql.com/downloads/workbench/)

## Установка программы

1. Запустите скачанный установочный файл
2. Следуйте инструкциям мастера установки
3. Установите как обычную программу для Windows

# Подключение к MySQL через Workbench

## Запуск MySQL Workbench

1. Запустите MySQL Workbench с рабочего стола или из меню "Пуск"

## Подключение к серверу

1. Нажмите на существующее соединение (обычно называется "Local instance MySQL")

2. Введите пароль root, который вы установили при инсталляции MySQL

# Создание базы данных

## Выполнение SQL-команд в MySQL Workbench

1. **Создаем базу данных**:
```sql
CREATE DATABASE partner_management;
```

```sql
USE partner_management;
```

Как выполнить команды:
Скопируйте команду SQL

Вставьте в окно редактора MySQL Workbench

Нажмите иконку молнии ⚡ (Execute) для выполнения

Повторите для каждой команды по очереди

### Создаем таблицы
В том же окне выполняем команды:
```sql
-- Таблица партнеров
CREATE TABLE partners (
    partner_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(50),
    address TEXT,
    registration_date DATE,
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица продаж
CREATE TABLE product_sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    partner_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    delivery_status ENUM('delivered', 'in_transit', 'pending') DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (partner_id) REFERENCES partners(partner_id) ON DELETE CASCADE
);
```
### Далее:
```sql
USE partner_management;

-- Добавьте эту команду перед DELETE
SET SQL_SAFE_UPDATES = 0;

-- 1. Очистим таблицы (если нужно)
DELETE FROM product_sales;
DELETE FROM partners;
ALTER TABLE partners AUTO_INCREMENT = 1;
ALTER TABLE product_sales AUTO_INCREMENT = 1;

-- 2. Добавляем партнеров
INSERT INTO partners (name, contact_person, email, phone, address, registration_date, status) VALUES
('ООО Ромашка', 'Иванов Иван', 'ivanov@romashka.ru', '+79991234567', 'Москва, ул. Ленина, 1', '2023-01-15', 'active'),
('ИП Сидоров', 'Сидоров Петр', 'sidorov@mail.ru', '+79997654321', 'СПб, Невский пр., 100', '2023-02-20', 'active'),
('ЗАО Весна', 'Петрова Мария', 'petrova@vesna.ru', '+79995554433', 'Екатеринбург, ул. Мира, 25', '2023-03-10', 'active'),
('ООО ТехноПрофи', 'Смирнов Алексей', 'smirnov@technopro.ru', '+79993332211', 'Новосибирск, ул. Советская, 50', '2023-04-05', 'active'),
('ИП Козлова', 'Козлова Анна', 'kozlova@mail.ru', '+79994445566', 'Казань, ул. Баумана, 30', '2023-05-12', 'inactive');

-- 3. Добавляем продажи
INSERT INTO product_sales (partner_id, product_name, quantity, sale_date, amount, delivery_status, notes) VALUES
(1, 'Продукт А', 10, '2024-01-10', 15000.00, 'delivered', 'Регулярная поставка'),
(1, 'Продукт Б', 5, '2024-01-15', 8000.50, 'in_transit', 'Срочный заказ'),
(2, 'Продукт А', 8, '2024-01-12', 12000.00, 'delivered', ''),
(2, 'Продукт В', 15, '2024-01-18', 25000.75, 'pending', 'Крупный заказ'),
(3, 'Продукт Б', 12, '2024-01-20', 18000.00, 'delivered', ''),
(3, 'Продукт А', 20, '2024-01-25', 30000.00, 'delivered', 'Оптовая закупка'),
(4, 'Продукт В', 7, '2024-01-22', 12000.25, 'in_transit', ''),
(5, 'Продукт А', 3, '2024-01-14', 4500.00, 'delivered', 'Пробный заказ');
```

### Проверим данные (убедимся что все загрузилось)
```sql
-- Проверяем партнеров
SELECT * FROM partners;

-- Проверяем продажи
SELECT * FROM product_sales;

-- Проверяем объединенные данные
SELECT p.name, ps.product_name, ps.quantity, ps.sale_date, ps.amount
FROM product_sales ps
JOIN partners p ON ps.partner_id = p.partner_id;
```

# Создание ER-диаграммы

## Генерация диаграммы в MySQL Workbench

### Шаги по созданию:

1. **Запустите Reverse Engineer**:
   - В меню выберите: `Database → Reverse Engineer`

2. **Пройдите шаги мастера**:
   - Нажимайте `Next → Next → Next`

3. **Выберите базу данных**:
   - Выберите базу: `partner_management`

4. **Запустите процесс**:
   - Нажмите кнопку `Execute`

### Экспорт диаграммы:

1. **Сохраните как PDF**:
   - В меню выберите: `File → Export → Export as PDF`

# Резервное копирование базы данных

## Экспорт базы данных в MySQL Workbench

### Шаги по созданию бэкапа:

1. **Запустите Data Export**:
   - В меню выберите: `Server → Data Export`

2. **Выберите базу данных**:
   - Выберите базу: `partner_management`

3. **Настройте параметры экспорта**:
   - Выберите опцию: `Export to Self-Contained File`

4. **Сохраните файл**:
   - Укажите имя файла: `partner_management_backup.sql`

# Тестирование функционала системы

## SQL-запросы для проверки основного функционала

### 1. Просмотр списка партнеров
```sql
SELECT * FROM partners WHERE status = 'active';
```

# Добавление нового партнера
```sql
INSERT INTO partners (name, contact_person, email, phone, address, registration_date, status)
VALUES ('Новый партнер', 'Контакное лицо', 'new@partner.ru', '+79990000000', 'Адрес', '2024-01-30', 'active');
```

# Редактирование данных партнера
```sql
UPDATE partners SET phone = '+79998887766' WHERE partner_id = 1;
```

# Просмотр истории реализации продукции
```sql
SELECT * FROM product_sales WHERE partner_id = 1;
```

# ОСНОВНЫЕ ЗАПРОСЫ ДЛЯ ПОДСИСТЕМЫ
```sql
-- Функционал 1: Просмотр списка партнеров
SELECT partner_id, name, contact_person, email, phone, status 
FROM partners 
ORDER BY name;

-- Функционал 2: Добавление/редактирование партнера
-- (вы уже тестировали выше)

-- Функционал 3: Просмотр истории реализации
SELECT p.name, ps.product_name, ps.quantity, ps.sale_date, ps.amount, ps.delivery_status
FROM product_sales ps
JOIN partners p ON ps.partner_id = p.partner_id
WHERE p.partner_id = 1  -- для конкретного партнера
ORDER BY ps.sale_date DESC;
```