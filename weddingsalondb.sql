-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 07 2026 г., 19:43
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
-- База данных: `weddingsalondb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `RegistrationDate` datetime DEFAULT current_timestamp(),
  `WeddingDate` date DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Активен'
) ;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`ClientID`, `FirstName`, `LastName`, `Phone`, `Email`, `RegistrationDate`, `WeddingDate`, `Budget`, `Notes`, `Status`) VALUES
(1, 'Анна', 'Иванова', '+79001234567', 'anna@mail.ru', '2026-02-07 02:09:21', '2024-06-15', 500000.00, 'Предпочитает классический стиль', 'Активен'),
(2, 'Екатерина', 'Петрова', '+79011234568', 'ekaterina@mail.ru', '2026-02-07 02:09:21', '2024-07-20', 750000.00, 'Любит кружевные платья', 'Активен'),
(3, 'Мария', 'Сидорова', '+79021234569', 'maria@mail.ru', '2026-02-07 02:09:21', '2024-08-10', 300000.00, 'Бюджетный вариант', 'Активен'),
(4, 'Ольга', 'Смирнова', '+79031234570', 'olga@mail.ru', '2026-02-07 02:09:21', '2024-09-05', 1000000.00, 'VIP клиент', 'Активен'),
(5, 'Татьяна', 'Кузнецова', '+79041234571', 'tatiana@mail.ru', '2026-02-07 02:09:21', '2024-10-12', 600000.00, NULL, 'Активен'),
(6, 'Ирина', 'Попова', '+79051234572', 'irina@mail.ru', '2026-02-07 02:09:21', '2024-06-30', 400000.00, 'Нужен полный комплект', 'Активен'),
(7, 'Светлана', 'Васильева', '+79061234573', 'svetlana@mail.ru', '2026-02-07 02:09:21', '2024-07-15', 550000.00, NULL, 'Активен'),
(8, 'Наталья', 'Федорова', '+79071234574', 'natalia@mail.ru', '2026-02-07 02:09:21', '2024-08-22', 350000.00, 'Вегетарианка', 'Активен'),
(9, 'Юлия', 'Морозова', '+79081234575', 'yulia@mail.ru', '2026-02-07 02:09:21', '2024-09-18', 800000.00, 'Зарубежная свадьба', 'Активен'),
(10, 'Александра', 'Николаева', '+79091234576', 'alexandra@mail.ru', '2026-02-07 02:09:21', '2024-10-05', 450000.00, NULL, 'Активен'),
(11, 'чмопсель', 'антуандесентэкзюпериевич', '+9999999', 'chmobik@lol.com', '2026-02-07 17:38:09', '2026-02-08', 5000000.00, 'даун', 'Активен');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `HireDate` date DEFAULT curdate(),
  `Salary` decimal(10,2) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FirstName`, `LastName`, `Position`, `Phone`, `Email`, `HireDate`, `Salary`, `IsActive`, `password`) VALUES
(1, 'Елена', 'Волкова', 'Администратор', '+79101112233', 'elenavolkova@salon.ru', '2023-01-15', 70000.00, 1, '1111'),
(2, 'Анастасия', 'Орлова', 'Консультант', '+79112223344', 'anastasia@salon.ru', '2023-03-20', 50000.00, 1, ''),
(3, 'Виктория', 'Антонова', 'Швея', '+79123334455', 'viktoria@salon.ru', '2023-02-10', 60000.00, 1, ''),
(4, 'Дарья', 'Тихонова', 'Администратор', '+79134445566', 'daria@salon.ru', '2023-04-05', 45000.00, 1, ''),
(5, 'Ксения', 'Романова', 'Консультант', '+79145556677', 'ksenia@salon.ru', '2023-05-12', 50000.00, 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `EventID` int(11) NOT NULL,
  `EventDate` datetime NOT NULL,
  `EventType` varchar(50) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Запланировано'
) ;

-- --------------------------------------------------------

--
-- Структура таблицы `fittings`
--

CREATE TABLE `fittings` (
  `FittingID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `FittingDate` datetime NOT NULL,
  `Duration` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Запланирована'
) ;

-- --------------------------------------------------------

--
-- Структура таблицы `orderproducts`
--

CREATE TABLE `orderproducts` (
  `OrderProductID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `Price` decimal(10,2) NOT NULL,
  `Discount` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `OrderDate` datetime DEFAULT current_timestamp(),
  `WeddingDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `Deposit` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT 'Не оплачено',
  `OrderStatus` varchar(20) DEFAULT 'Новый',
  `Notes` text DEFAULT NULL
) ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`OrderID`, `ClientID`, `EmployeeID`, `OrderDate`, `WeddingDate`, `TotalAmount`, `Deposit`, `PaymentStatus`, `OrderStatus`, `Notes`) VALUES
(1, 1, 1, '2024-01-10 00:00:00', '2024-06-15', 250000.00, 50000.00, 'Частично', 'В работе', NULL),
(2, 2, 2, '2024-01-15 00:00:00', '2024-07-20', 350000.00, 100000.00, 'Частично', 'В работе', NULL),
(3, 3, 3, '2024-01-20 00:00:00', '2024-08-10', 150000.00, 30000.00, 'Не оплачено', 'Новый', NULL),
(4, 4, 1, '2024-01-25 00:00:00', '2024-09-05', 500000.00, 200000.00, 'Частично', 'В работе', NULL),
(5, 5, 2, '2024-02-01 00:00:00', '2024-10-12', 280000.00, 70000.00, 'Частично', 'В работе', NULL),
(6, 6, 3, '2024-02-05 00:00:00', '2024-06-30', 180000.00, 40000.00, 'Не оплачено', 'Новый', NULL),
(7, 7, 1, '2024-02-10 00:00:00', '2024-07-15', 220000.00, 50000.00, 'Частично', 'В работе', NULL),
(8, 8, 2, '2024-02-15 00:00:00', '2024-08-22', 160000.00, 30000.00, 'Не оплачено', 'Новый', NULL),
(9, 9, 3, '2024-02-20 00:00:00', '2024-09-18', 400000.00, 100000.00, 'Частично', 'В работе', NULL),
(10, 10, 1, '2024-02-25 00:00:00', '2024-10-05', 200000.00, 40000.00, 'Частично', 'В работе', NULL),
(11, 11, 1, '2026-02-07 00:00:00', '2026-02-08', 67000.00, 0.00, 'Не оплачено', 'Отменен', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orderservices`
--

CREATE TABLE `orderservices` (
  `OrderServiceID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `Price` decimal(10,2) NOT NULL,
  `ServiceDate` date DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orderstatuslog`
--

CREATE TABLE `orderstatuslog` (
  `LogID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `OldStatus` varchar(20) DEFAULT NULL,
  `NewStatus` varchar(20) DEFAULT NULL,
  `ChangeDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PaymentDate` datetime DEFAULT current_timestamp(),
  `Amount` decimal(10,2) NOT NULL,
  `PaymentMethod` varchar(30) DEFAULT NULL,
  `PaymentType` varchar(20) DEFAULT 'Депозит',
  `Notes` varchar(255) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `PurchasePrice` decimal(10,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT 0,
  `Vendor` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `IsAvailable` tinyint(1) DEFAULT 1
) ;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Category`, `Size`, `Color`, `Price`, `PurchasePrice`, `Quantity`, `Vendor`, `Description`, `IsAvailable`) VALUES
(1, 'Платье Алиса', 'Платье', 'S', 'Белый', 150000.00, 80000.00, 3, 'Pronovias', NULL, 1),
(2, 'Платье Белла', 'Платье', 'M', 'Слоновая кость', 180000.00, 95000.00, 2, 'Rosa Clara', NULL, 1),
(3, 'Платье Виктория', 'Платье', 'L', 'Белый', 120000.00, 60000.00, 1, 'Maggie Sottero', NULL, 1),
(4, 'Костюм Престиж', 'Костюм', '52', 'Черный', 80000.00, 40000.00, 5, 'Armani', NULL, 1),
(5, 'Костюм Элегант', 'Костюм', '48', 'Серый', 70000.00, 35000.00, 3, 'Hugo Boss', NULL, 1),
(6, 'Фата кружевная', 'Аксессуар', 'Универсальный', 'Белый', 25000.00, 10000.00, 10, 'VeilTrends', NULL, 1),
(7, 'Перчатки шелковые', 'Аксессуар', 'M', 'Белый', 8000.00, 3000.00, 15, 'BridalAccessories', NULL, 1),
(8, 'Туфли Bella', 'Аксессуар', '38', 'Белый', 35000.00, 15000.00, 8, 'Badgley Mischka', NULL, 1),
(9, 'Пояс со стразами', 'Украшение', 'Универсальный', 'Серебро', 15000.00, 6000.00, 12, 'Swarovski', NULL, 1),
(10, 'Серьги жемчужные', 'Украшение', 'Универсальный', 'Белый', 20000.00, 8000.00, 10, 'PearlMaster', NULL, 1),
(11, 'Платье Греция', 'Платье', 'XS', 'Белый', 220000.00, 110000.00, 1, 'Pronovias', NULL, 1),
(12, 'Платье Ампир', 'Платье', 'M', 'Слоновая кость', 190000.00, 100000.00, 2, 'Rosa Clara', NULL, 1),
(13, 'Костюм Классик', 'Костюм', '50', 'Черный', 75000.00, 38000.00, 4, 'Armani', NULL, 1),
(14, 'Галстук шелковый', 'Аксессуар', 'Универсальный', 'Бордовый', 5000.00, 2000.00, 20, 'TieMaster', NULL, 1),
(15, 'Бутоньерка', 'Аксессуар', 'Универсальный', 'Белый', 3000.00, 1000.00, 25, 'FlowerArt', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `ServiceID` int(11) NOT NULL,
  `ServiceName` varchar(100) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`ServiceID`, `ServiceName`, `Category`, `Price`, `Duration`, `Description`, `IsActive`) VALUES
(1, 'Аренда платья', 'Аренда', 50000.00, NULL, 'Аренда на 3 дня', 1),
(2, 'Пошив платья', 'Пошив', 100000.00, 30, 'Индивидуальный пошив', 1),
(3, 'Аренда костюма', 'Аренда', 20000.00, NULL, 'Аренда на 2 дня', 1),
(4, 'Консультация стилиста', 'Аксессуары', 5000.00, 60, 'Персональная консультация', 1),
(5, 'Уход за платьем', 'Аксессуары', 15000.00, NULL, 'Химчистка и хранение', 1),
(6, 'Аренда аксессуаров', 'Аренда', 10000.00, NULL, 'Фата, перчатки, сумочка', 1),
(7, 'Фотосессика', 'Аксессуары', 30000.00, 120, 'Пробная фотосессия в салоне', 1),
(8, 'Доставка', 'Аксессуары', 5000.00, NULL, 'Доставка к месту свадьбы', 1),
(9, 'Подгонка платья', 'Пошив', 15000.00, 14, 'Подгонка по фигуре', 1),
(10, 'Аренда украшений', 'Аренда', 8000.00, NULL, 'Бижутерия на день свадьбы', 1);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_activeorders`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_activeorders` (
`OrderID` int(11)
,`OrderDate` datetime
,`ClientName` varchar(101)
,`Phone` varchar(20)
,`WeddingDate` date
,`TotalAmount` decimal(10,2)
,`Deposit` decimal(10,2)
,`PaymentStatus` varchar(20)
,`OrderStatus` varchar(20)
,`ManagerName` varchar(101)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_clientdatabase`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_clientdatabase` (
`ClientID` int(11)
,`FullName` varchar(101)
,`Phone` varchar(20)
,`Email` varchar(100)
,`WeddingDate` date
,`Budget` decimal(10,2)
,`OrdersCount` bigint(21)
,`TotalSpent` decimal(32,2)
,`LastOrderDate` datetime
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_eventcalendar`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_eventcalendar` (
`EventID` int(11)
,`EventDate` datetime
,`EventType` varchar(50)
,`ClientName` varchar(101)
,`Phone` varchar(20)
,`EmployeeName` varchar(101)
,`Description` varchar(255)
,`Status` varchar(20)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_financialreport`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_financialreport` (
`Year` int(4)
,`Month` int(2)
,`OrdersCount` bigint(21)
,`TotalReceived` decimal(32,2)
,`TotalOrders` decimal(32,2)
,`Debt` decimal(33,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_inventory`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_inventory` (
`ProductID` int(11)
,`ProductName` varchar(100)
,`Category` varchar(50)
,`Size` varchar(20)
,`Color` varchar(30)
,`Price` decimal(10,2)
,`CurrentStock` int(11)
,`Vendor` varchar(100)
,`ReservedQuantity` decimal(32,0)
,`AvailableQuantity` decimal(33,0)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_productsales`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_productsales` (
`ProductID` int(11)
,`ProductName` varchar(100)
,`Category` varchar(50)
,`TotalSold` decimal(32,0)
,`TotalRevenue` decimal(52,8)
,`AveragePrice` decimal(24,12)
,`CurrentStock` int(11)
);

-- --------------------------------------------------------

--
-- Структура для представления `v_activeorders`
--
DROP TABLE IF EXISTS `v_activeorders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_activeorders`  AS SELECT `o`.`OrderID` AS `OrderID`, `o`.`OrderDate` AS `OrderDate`, concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `ClientName`, `c`.`Phone` AS `Phone`, `o`.`WeddingDate` AS `WeddingDate`, `o`.`TotalAmount` AS `TotalAmount`, `o`.`Deposit` AS `Deposit`, `o`.`PaymentStatus` AS `PaymentStatus`, `o`.`OrderStatus` AS `OrderStatus`, concat(`e`.`FirstName`,' ',`e`.`LastName`) AS `ManagerName` FROM ((`orders` `o` join `clients` `c` on(`o`.`ClientID` = `c`.`ClientID`)) join `employees` `e` on(`o`.`EmployeeID` = `e`.`EmployeeID`)) WHERE `o`.`OrderStatus` not in ('Выдан','Отменен') ;

-- --------------------------------------------------------

--
-- Структура для представления `v_clientdatabase`
--
DROP TABLE IF EXISTS `v_clientdatabase`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_clientdatabase`  AS SELECT `c`.`ClientID` AS `ClientID`, concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `FullName`, `c`.`Phone` AS `Phone`, `c`.`Email` AS `Email`, `c`.`WeddingDate` AS `WeddingDate`, `c`.`Budget` AS `Budget`, count(`o`.`OrderID`) AS `OrdersCount`, coalesce(sum(`o`.`TotalAmount`),0) AS `TotalSpent`, max(`o`.`OrderDate`) AS `LastOrderDate` FROM (`clients` `c` left join `orders` `o` on(`c`.`ClientID` = `o`.`ClientID`)) GROUP BY `c`.`ClientID`, `c`.`FirstName`, `c`.`LastName`, `c`.`Phone`, `c`.`Email`, `c`.`WeddingDate`, `c`.`Budget` ;

-- --------------------------------------------------------

--
-- Структура для представления `v_eventcalendar`
--
DROP TABLE IF EXISTS `v_eventcalendar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_eventcalendar`  AS SELECT `e`.`EventID` AS `EventID`, `e`.`EventDate` AS `EventDate`, `e`.`EventType` AS `EventType`, concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `ClientName`, `c`.`Phone` AS `Phone`, concat(`emp`.`FirstName`,' ',`emp`.`LastName`) AS `EmployeeName`, `e`.`Description` AS `Description`, `e`.`Status` AS `Status` FROM ((`events` `e` left join `clients` `c` on(`e`.`ClientID` = `c`.`ClientID`)) left join `employees` `emp` on(`e`.`EmployeeID` = `emp`.`EmployeeID`)) WHERE `e`.`Status` = 'Запланировано' ;

-- --------------------------------------------------------

--
-- Структура для представления `v_financialreport`
--
DROP TABLE IF EXISTS `v_financialreport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_financialreport`  AS SELECT year(`p`.`PaymentDate`) AS `Year`, month(`p`.`PaymentDate`) AS `Month`, count(distinct `p`.`OrderID`) AS `OrdersCount`, coalesce(sum(`p`.`Amount`),0) AS `TotalReceived`, coalesce(sum(`o`.`TotalAmount`),0) AS `TotalOrders`, coalesce(sum(`o`.`TotalAmount`),0) - coalesce(sum(`p`.`Amount`),0) AS `Debt` FROM (`payments` `p` join `orders` `o` on(`p`.`OrderID` = `o`.`OrderID`)) GROUP BY year(`p`.`PaymentDate`), month(`p`.`PaymentDate`) ;

-- --------------------------------------------------------

--
-- Структура для представления `v_inventory`
--
DROP TABLE IF EXISTS `v_inventory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventory`  AS SELECT `p`.`ProductID` AS `ProductID`, `p`.`ProductName` AS `ProductName`, `p`.`Category` AS `Category`, `p`.`Size` AS `Size`, `p`.`Color` AS `Color`, `p`.`Price` AS `Price`, `p`.`Quantity` AS `CurrentStock`, `p`.`Vendor` AS `Vendor`, coalesce(sum(`op`.`Quantity`),0) AS `ReservedQuantity`, `p`.`Quantity`- coalesce(sum(`op`.`Quantity`),0) AS `AvailableQuantity` FROM (`products` `p` left join `orderproducts` `op` on(`p`.`ProductID` = `op`.`ProductID`)) WHERE `op`.`OrderID` in (select `orders`.`OrderID` from `orders` where `orders`.`OrderStatus` not in ('Выдан','Отменен')) GROUP BY `p`.`ProductID`, `p`.`ProductName`, `p`.`Category`, `p`.`Size`, `p`.`Color`, `p`.`Price`, `p`.`Quantity`, `p`.`Vendor` ;

-- --------------------------------------------------------

--
-- Структура для представления `v_productsales`
--
DROP TABLE IF EXISTS `v_productsales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_productsales`  AS SELECT `p`.`ProductID` AS `ProductID`, `p`.`ProductName` AS `ProductName`, `p`.`Category` AS `Category`, coalesce(sum(`op`.`Quantity`),0) AS `TotalSold`, coalesce(sum(`op`.`Price` * `op`.`Quantity` * (1 - coalesce(`op`.`Discount`,0) / 100)),0) AS `TotalRevenue`, avg(`op`.`Price` * (1 - coalesce(`op`.`Discount`,0) / 100)) AS `AveragePrice`, `p`.`Quantity` AS `CurrentStock` FROM (`products` `p` left join `orderproducts` `op` on(`p`.`ProductID` = `op`.`ProductID`)) GROUP BY `p`.`ProductID`, `p`.`ProductName`, `p`.`Category`, `p`.`Quantity` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD KEY `idx_Clients_WeddingDate` (`WeddingDate`),
  ADD KEY `idx_Clients_Phone` (`Phone`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `fk_Events_Orders` (`OrderID`),
  ADD KEY `fk_Events_Clients` (`ClientID`),
  ADD KEY `fk_Events_Employees` (`EmployeeID`),
  ADD KEY `idx_Events_EventDate` (`EventDate`),
  ADD KEY `idx_Events_EventType` (`EventType`);

--
-- Индексы таблицы `fittings`
--
ALTER TABLE `fittings`
  ADD PRIMARY KEY (`FittingID`),
  ADD KEY `fk_Fittings_Employees` (`EmployeeID`),
  ADD KEY `idx_Fittings_FittingDate` (`FittingDate`),
  ADD KEY `idx_Fittings_OrderID` (`OrderID`);

--
-- Индексы таблицы `orderproducts`
--
ALTER TABLE `orderproducts`
  ADD PRIMARY KEY (`OrderProductID`),
  ADD KEY `idx_OrderProducts_OrderID` (`OrderID`),
  ADD KEY `idx_OrderProducts_ProductID` (`ProductID`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fk_Orders_Clients` (`ClientID`),
  ADD KEY `fk_Orders_Employees` (`EmployeeID`),
  ADD KEY `idx_Orders_OrderDate` (`OrderDate`),
  ADD KEY `idx_Orders_PaymentStatus` (`PaymentStatus`),
  ADD KEY `idx_Orders_OrderStatus` (`OrderStatus`),
  ADD KEY `idx_Orders_WeddingDate` (`WeddingDate`);

--
-- Индексы таблицы `orderservices`
--
ALTER TABLE `orderservices`
  ADD PRIMARY KEY (`OrderServiceID`),
  ADD KEY `fk_OrderServices_Services` (`ServiceID`),
  ADD KEY `fk_OrderServices_Employees` (`EmployeeID`),
  ADD KEY `idx_OrderServices_OrderID` (`OrderID`);

--
-- Индексы таблицы `orderstatuslog`
--
ALTER TABLE `orderstatuslog`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `fk_OrderStatusLog_Orders` (`OrderID`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `idx_Payments_PaymentDate` (`PaymentDate`),
  ADD KEY `idx_Payments_OrderID` (`OrderID`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `idx_Products_Category` (`Category`),
  ADD KEY `idx_Products_Price` (`Price`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fittings`
--
ALTER TABLE `fittings`
  MODIFY `FittingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orderproducts`
--
ALTER TABLE `orderproducts`
  MODIFY `OrderProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orderservices`
--
ALTER TABLE `orderservices`
  MODIFY `OrderServiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orderstatuslog`
--
ALTER TABLE `orderstatuslog`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_Events_Clients` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Events_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  ADD CONSTRAINT `fk_Events_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `fittings`
--
ALTER TABLE `fittings`
  ADD CONSTRAINT `fk_Fittings_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  ADD CONSTRAINT `fk_Fittings_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orderproducts`
--
ALTER TABLE `orderproducts`
  ADD CONSTRAINT `fk_OrderProducts_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_OrderProducts_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_Orders_Clients` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Orders_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);

--
-- Ограничения внешнего ключа таблицы `orderservices`
--
ALTER TABLE `orderservices`
  ADD CONSTRAINT `fk_OrderServices_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  ADD CONSTRAINT `fk_OrderServices_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_OrderServices_Services` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`);

--
-- Ограничения внешнего ключа таблицы `orderstatuslog`
--
ALTER TABLE `orderstatuslog`
  ADD CONSTRAINT `fk_OrderStatusLog_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_Payments_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
