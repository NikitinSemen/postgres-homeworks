
-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student (
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
)

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student ADD COLUMN midle_name varchar

-- 3. Удалить колонку middle_name

ALTER TABLE student DROP COLUMN midle_name
-- 4. Переименовать колонку birthday в birth_date

ALTER TABLE student RENAME birthday TO birth_date
-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32)

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birthday, phone)
VALUES ('Georgy', 'Gurov', '15.12.2001', '65665845516854'),
('Michael', 'John', '12.12.1991', '54666565146541651'),
('John', 'Michael', '10.11.1914', '5466656514454654'),
('Mich', 'Joh', '12.01.1994', '54666515146541651');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student RESTART IDENTITY