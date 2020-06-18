-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 18 2020 г., 16:12
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `	bd_metroland`
--

-- --------------------------------------------------------

--
-- Структура таблицы `buyer`
--

CREATE TABLE `buyer` (
  `id_buyer` int(4) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `password` varchar(16) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `house` int(4) NOT NULL,
  `structure` varchar(4) DEFAULT NULL,
  `post_Index` int(10) DEFAULT NULL,
  `porch` int(4) DEFAULT NULL,
  `floor` int(3) NOT NULL,
  `flat` int(4) NOT NULL,
  `birthday` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(18) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `buyer`
--

INSERT INTO `buyer` (`id_buyer`, `last_name`, `name`, `middle_name`, `password`, `city`, `street`, `house`, `structure`, `post_Index`, `porch`, `floor`, `flat`, `birthday`, `gender`, `phone`, `email`) VALUES
(5, 'Иванов', 'Иван', 'Семёныч', 'ragnar_lodbrok', 'Москва', 'Гороховский переулок', 4, 'С', 1234567, NULL, 7, 77, '9 мая  1945', 'Мужской', '88005553535', 'ratatuy@mail.ru'),
(6, 'Лодброк', 'Рагнар', 'Норвежский', 'konung921', 'kattegat', 'Гороховский переулок', 4, NULL, NULL, NULL, 2, 9, '1 июня 1941', 'Мужской', '9999999999', 'lol1234@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `delivery`
--

CREATE TABLE `delivery` (
  `id_delivery` int(4) NOT NULL,
  `date` datetime(6) NOT NULL,
  `cost` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delivery`
--

INSERT INTO `delivery` (`id_delivery`, `date`, `cost`) VALUES
(3, '2020-05-21 14:00:00.000000', 290);

-- --------------------------------------------------------

--
-- Структура таблицы `filter`
--

CREATE TABLE `filter` (
  `id_filter` int(4) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `filter`
--

INSERT INTO `filter` (`id_filter`, `name`) VALUES
(1, 'научная литература'),
(2, 'детская литература'),
(3, 'нАУЧНО-ФАНТАСТИЧЕСКАЯ');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id_goods` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `cost` int(16) NOT NULL,
  `author` varchar(64) DEFAULT NULL,
  `id_filter` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id_goods`, `name`, `cost`, `author`, `id_filter`) VALUES
(4, 'метро 3022', 699, 'Глуховский', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `ord`
--

CREATE TABLE `ord` (
  `id_ord` int(4) NOT NULL COMMENT 'Номер заказа',
  `id_buyer` int(4) NOT NULL COMMENT 'Номер покупателя',
  `id_goods` int(11) NOT NULL COMMENT 'Номер товара',
  `id_delivery` int(4) NOT NULL COMMENT 'Номер доставки',
  `cost` int(11) NOT NULL COMMENT 'Цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ord`
--

INSERT INTO `ord` (`id_ord`, `id_buyer`, `id_goods`, `id_delivery`, `cost`) VALUES
(8, 5, 4, 3, 1499);

-- --------------------------------------------------------

--
-- Структура таблицы `testing`
--

CREATE TABLE `testing` (
  `id` int(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` text NOT NULL,
  `password` varchar(16) NOT NULL,
  `phone` int(18) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`id_buyer`);

--
-- Индексы таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id_delivery`);

--
-- Индексы таблицы `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`id_filter`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id_goods`),
  ADD KEY `id_filter` (`id_filter`);

--
-- Индексы таблицы `ord`
--
ALTER TABLE `ord`
  ADD PRIMARY KEY (`id_ord`),
  ADD KEY `id_delivery` (`id_delivery`),
  ADD KEY `id_goods` (`id_goods`),
  ADD KEY `id_buyer` (`id_buyer`);

--
-- Индексы таблицы `testing`
--
ALTER TABLE `testing`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `buyer`
--
ALTER TABLE `buyer`
  MODIFY `id_buyer` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id_delivery` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `filter`
--
ALTER TABLE `filter`
  MODIFY `id_filter` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id_goods` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `ord`
--
ALTER TABLE `ord`
  MODIFY `id_ord` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Номер заказа', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `testing`
--
ALTER TABLE `testing`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`id_filter`) REFERENCES `filter` (`id_filter`);

--
-- Ограничения внешнего ключа таблицы `ord`
--
ALTER TABLE `ord`
  ADD CONSTRAINT `ord_ibfk_3` FOREIGN KEY (`id_delivery`) REFERENCES `delivery` (`id_delivery`),
  ADD CONSTRAINT `ord_ibfk_4` FOREIGN KEY (`id_goods`) REFERENCES `goods` (`id_goods`),
  ADD CONSTRAINT `ord_ibfk_5` FOREIGN KEY (`id_buyer`) REFERENCES `buyer` (`id_buyer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
