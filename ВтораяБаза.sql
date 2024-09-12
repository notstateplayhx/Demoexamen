-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 12 2024 г., 14:14
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `DataAnalysis`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `master_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`comment_id`, `message`, `master_id`, `request_id`) VALUES
(1, 'Интересно...', 2, 1),
(2, 'Будем разбираться!', 3, 2),
(3, 'Сделаем всё на высшем уровне!', 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `orgTechTypes`
--

CREATE TABLE `orgTechTypes` (
  `org_tech_type_id` int(11) NOT NULL,
  `org_tech_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orgTechTypes`
--

INSERT INTO `orgTechTypes` (`org_tech_type_id`, `org_tech_type`) VALUES
(1, 'Компьютер'),
(2, 'Ноутбук'),
(3, 'Принтер');

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `request_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `org_tech_type_id` int(11) NOT NULL,
  `org_tech_model` varchar(255) NOT NULL,
  `problem_descryption` text NOT NULL,
  `request_status_id` int(11) NOT NULL,
  `completion_date` datetime DEFAULT NULL,
  `repair_parts` varchar(255) NOT NULL,
  `master_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requests`
--

INSERT INTO `requests` (`request_id`, `start_date`, `org_tech_type_id`, `org_tech_model`, `problem_descryption`, `request_status_id`, `completion_date`, `repair_parts`, `master_id`, `client_id`) VALUES
(1, '2023-06-06 00:00:00', 1, 'DEXP Aquilon O286', 'Перестал работать', 1, NULL, '', 2, 7),
(2, '2023-05-05 00:00:00', 1, 'DEXP Atlas H388', 'Перестал работать', 1, NULL, '', 3, 8),
(3, '2022-07-07 00:00:00', 2, 'MSI GF76 Katana 11UC-879XRU черный', 'Выключается', 2, '2023-01-01 00:00:00', '', 3, 9),
(4, '2023-08-02 00:00:00', 2, 'MSI Modern 15 B12M-211RU черный', 'Выключается', 3, NULL, '', NULL, 8),
(5, '2023-08-02 00:00:00', 3, 'HP LaserJet Pro M404dn', 'Перестала включаться', 3, NULL, '', NULL, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `requestStatuses`
--

CREATE TABLE `requestStatuses` (
  `request_status_id` int(11) NOT NULL,
  `request_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requestStatuses`
--

INSERT INTO `requestStatuses` (`request_status_id`, `request_status`) VALUES
(1, 'В процессе ремонта'),
(2, 'Готова к выдаче'),
(3, 'Новая заявка');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`type_id`, `type`) VALUES
(1, 'Менеджер'),
(2, 'Мастер'),
(3, 'Оператор'),
(4, 'Заказчик');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `fio`, `phone`, `username`, `password`, `type_id`) VALUES
(1, 'Носов Иван Михайлович', '89210563128', 'login1', 'pass1', 1),
(2, 'Ильин Александр Андреевич', '89535078985', 'login2', 'pass2', 2),
(3, 'Никифоров Иван Дмитриевич', '89210673849', 'login3', 'pass3', 2),
(4, 'Елисеев Артём Леонидович', '89990563748', 'login4', 'pass4', 3),
(5, 'Титов Сергей Кириллович', '89994563847', 'login5', 'pass5', 3),
(6, 'Григорьев Семён Викторович', '89219567849', 'login11', 'pass11', 4),
(7, 'Сорокин Дмитрий Ильич', '89219567841', 'login12', 'pass12', 4),
(8, 'Белоусов Егор Ярославович', '89219567842', 'login13', 'pass13', 4),
(9, 'Суслов Михаил Александрович', '89219567843', 'login14', 'pass14', 4),
(10, 'Васильев Вячеслав Александрович', '89219567844', 'login15', 'pass15', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `master_id` (`master_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Индексы таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  ADD PRIMARY KEY (`org_tech_type_id`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `master_id` (`master_id`,`client_id`),
  ADD KEY `org_tech_type_id` (`org_tech_type_id`,`request_status_id`),
  ADD KEY `request_status_id` (`request_status_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  ADD PRIMARY KEY (`request_status_id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `login` (`username`),
  ADD KEY `type_id` (`type_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orgTechTypes`
--
ALTER TABLE `orgTechTypes`
  MODIFY `org_tech_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `requestStatuses`
--
ALTER TABLE `requestStatuses`
  MODIFY `request_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `requests` (`request_id`);

--
-- Ограничения внешнего ключа таблицы `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`org_tech_type_id`) REFERENCES `orgTechTypes` (`org_tech_type_id`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`request_status_id`) REFERENCES `requestStatuses` (`request_status_id`),
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `requests_ibfk_4` FOREIGN KEY (`master_id`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
