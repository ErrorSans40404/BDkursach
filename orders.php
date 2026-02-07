<?php
session_start();

// Проверка авторизации
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Подключение к базе данных
$host = 'localhost';
$dbname = 'weddingsalondb';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Ошибка подключения к базе данных: " . $e->getMessage());
}

// Обработка добавления нового заказа
$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_order'])) {
    $clientID = trim($_POST['client_id'] ?? '');
    $employeeID = $_SESSION['user_id']; // ID текущего сотрудника
    $orderDate = trim($_POST['order_date'] ?? '');
    $weddingDate = trim($_POST['wedding_date'] ?? '');
    $totalAmount = trim($_POST['total_amount'] ?? '');
    $deposit = trim($_POST['deposit'] ?? '');
    $paymentStatus = trim($_POST['payment_status'] ?? '');
    $orderStatus = trim($_POST['order_status'] ?? '');
    $notes = trim($_POST['notes'] ?? '');

    // Валидация
    if (empty($clientID) || empty($orderDate) || empty($totalAmount) || empty($paymentStatus) || empty($orderStatus)) {
        $error = 'Клиент, дата заказа, сумма, статус оплаты и статус заказа обязательны';
    } elseif (!is_numeric($totalAmount) || $totalAmount <= 0) {
        $error = 'Сумма должна быть положительным числом';
    } elseif (!empty($deposit) && (!is_numeric($deposit) || $deposit < 0)) {
        $error = 'Аванс должен быть положительным числом или нулем';
    } else {
        try {
            // Проверяем существование клиента
            $stmt = $pdo->prepare("SELECT ClientID FROM clients WHERE ClientID = :client_id");
            $stmt->execute([':client_id' => $clientID]);

            if (!$stmt->fetch()) {
                $error = 'Клиент с таким ID не найден';
            } else {
                $stmt = $pdo->prepare("INSERT INTO orders (ClientID, EmployeeID, OrderDate, WeddingDate, TotalAmount, Deposit, PaymentStatus, OrderStatus, Notes)
                                      VALUES (:client_id, :employee_id, :order_date, :wedding_date, :total_amount, :deposit, :payment_status, :order_status, :notes)");

                $stmt->execute([
                    ':client_id' => $clientID,
                    ':employee_id' => $employeeID,
                    ':order_date' => $orderDate,
                    ':wedding_date' => $weddingDate ?: null,
                    ':total_amount' => $totalAmount,
                    ':deposit' => $deposit ?: 0,
                    ':payment_status' => $paymentStatus,
                    ':order_status' => $orderStatus,
                    ':notes' => $notes ?: null
                ]);

                $success = 'Заказ успешно добавлен!';

                // Очищаем поля формы
                $_POST = [];

            }
        } catch(PDOException $e) {
            $error = 'Ошибка при добавлении заказа: ' . $e->getMessage();
        }
    }
}

// Получение списка заказов с именами клиентов и сотрудников
$orders = [];
try {
    $stmt = $pdo->query("
        SELECT o.*,
               c.FirstName AS ClientFirstName, c.LastName AS ClientLastName,
               e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName
        FROM orders o
        LEFT JOIN clients c ON o.ClientID = c.ClientID
        LEFT JOIN employees e ON o.EmployeeID = e.EmployeeID
        ORDER BY o.OrderID DESC
    ");
    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    $error = 'Ошибка при загрузке списка заказов: ' . $e->getMessage();
}

// Получение списка клиентов для выпадающего списка
$clients = [];
try {
    $stmt = $pdo->query("SELECT ClientID, FirstName, LastName FROM clients ORDER BY LastName, FirstName");
    $clients = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    // Если есть ошибка, просто оставляем пустой список
}
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Заказы - Свадебный салон</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffe6f2;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .header {
            background-color: #ff66b2;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-bottom: 30px;
            color: white;
        }

        .header h1 {
            margin: 0;
            font-size: 28px;
        }

        .nav-links {
            text-align: center;
            margin-bottom: 20px;
        }

        .nav-link {
            display: inline-block;
            margin: 0 10px;
            padding: 8px 15px;
            background-color: #ffccdd;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
        }

        .nav-link:hover {
            background-color: #ff99cc;
        }

        .section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .section-title {
            color: #ff3399;
            margin-top: 0;
            border-bottom: 2px solid #ffccdd;
            padding-bottom: 10px;
        }

        .message {
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .error {
            background-color: #ffcccc;
            color: #cc0000;
            border: 1px solid #ff9999;
        }

        .success {
            background-color: #ccffcc;
            color: #006600;
            border: 1px solid #99ff99;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="number"],
        textarea,
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ff99cc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            height: 80px;
        }

        .submit-btn {
            background-color: #ff66b2;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .submit-btn:hover {
            background-color: #ff3399;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .orders-table th,
        .orders-table td {
            border: 1px solid #ff99cc;
            padding: 10px;
            text-align: left;
        }

        .orders-table th {
            background-color: #ffccdd;
            color: #333;
            font-weight: bold;
        }

        .orders-table tr:nth-child(even) {
            background-color: #fff5f9;
        }

        .orders-table tr:hover {
            background-color: #ffe6f2;
        }

        .amount {
            text-align: right;
        }

        .status-new {
            color: #0066cc;
            font-weight: bold;
        }

        .status-in-work {
            color: #ff9900;
            font-weight: bold;
        }

        .status-completed {
            color: #006600;
            font-weight: bold;
        }

        .payment-partial {
            color: #ff9900;
            font-weight: bold;
        }

        .payment-not-paid {
            color: #cc0000;
            font-weight: bold;
        }

        .payment-paid {
            color: #006600;
            font-weight: bold;
        }

        .required {
            color: #ff0000;
        }

        @media (max-width: 768px) {
            .orders-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Управление заказами</h1>
    </div>

    <div class="nav-links">
        <a href="workplace.php" class="nav-link">← Назад в рабочее место</a>
        <a href="index.php" class="nav-link">На главную</a>
        <a href="logout.php" class="nav-link">Выйти</a>
    </div>

    <!-- Форма добавления заказа -->
    <div class="section">
        <h2 class="section-title">Добавить новый заказ</h2>

        <?php if ($error): ?>
            <div class="message error"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>

        <?php if ($success): ?>
            <div class="message success"><?php echo htmlspecialchars($success); ?></div>
        <?php endif; ?>

        <form method="POST" action="">
            <div class="form-group">
                <label for="client_id">Клиент <span class="required">*</span></label>
                <select id="client_id" name="client_id" required>
                    <option value="">Выберите клиента</option>
                    <?php foreach ($clients as $client): ?>
                        <option value="<?php echo htmlspecialchars($client['ClientID']); ?>"
                            <?php echo (isset($_POST['client_id']) && $_POST['client_id'] == $client['ClientID']) ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($client['LastName'] . ' ' . $client['FirstName'] . ' (ID: ' . $client['ClientID'] . ')'); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="order_date">Дата заказа <span class="required">*</span></label>
                <input type="date" id="order_date" name="order_date" required
                       value="<?php echo htmlspecialchars($_POST['order_date'] ?? date('Y-m-d')); ?>">
            </div>

            <div class="form-group">
                <label for="wedding_date">Дата свадьбы</label>
                <input type="date" id="wedding_date" name="wedding_date"
                       value="<?php echo htmlspecialchars($_POST['wedding_date'] ?? ''); ?>">
            </div>

            <div class="form-group">
                <label for="total_amount">Общая сумма (руб.) <span class="required">*</span></label>
                <input type="number" id="total_amount" name="total_amount" required min="0" step="1000"
                       value="<?php echo htmlspecialchars($_POST['total_amount'] ?? ''); ?>">
            </div>

            <div class="form-group">
                <label for="deposit">Аванс (руб.)</label>
                <input type="number" id="deposit" name="deposit" min="0" step="1000"
                       value="<?php echo htmlspecialchars($_POST['deposit'] ?? '0'); ?>">
            </div>

            <div class="form-group">
                <label for="payment_status">Статус оплаты <span class="required">*</span></label>
                <select id="payment_status" name="payment_status" required>
                    <option value="">Выберите статус</option>
                    <option value="Не оплачено" <?php echo (isset($_POST['payment_status']) && $_POST['payment_status'] == 'Не оплачено') ? 'selected' : ''; ?>>Не оплачено</option>
                    <option value="Частично" <?php echo (isset($_POST['payment_status']) && $_POST['payment_status'] == 'Частично') ? 'selected' : ''; ?>>Частично</option>
                    <option value="Оплачено" <?php echo (isset($_POST['payment_status']) && $_POST['payment_status'] == 'Оплачено') ? 'selected' : ''; ?>>Оплачено</option>
                </select>
            </div>

            <div class="form-group">
                <label for="order_status">Статус заказа <span class="required">*</span></label>
                <select id="order_status" name="order_status" required>
                    <option value="">Выберите статус</option>
                    <option value="Новый" <?php echo (isset($_POST['order_status']) && $_POST['order_status'] == 'Новый') ? 'selected' : ''; ?>>Новый</option>
                    <option value="В работе" <?php echo (isset($_POST['order_status']) && $_POST['order_status'] == 'В работе') ? 'selected' : ''; ?>>В работе</option>
                    <option value="Завершен" <?php echo (isset($_POST['order_status']) && $_POST['order_status'] == 'Завершен') ? 'selected' : ''; ?>>Завершен</option>
                    <option value="Отменен" <?php echo (isset($_POST['order_status']) && $_POST['order_status'] == 'Отменен') ? 'selected' : ''; ?>>Отменен</option>
                </select>
            </div>

            <div class="form-group">
                <label for="notes">Примечания</label>
                <textarea id="notes" name="notes"><?php echo htmlspecialchars($_POST['notes'] ?? ''); ?></textarea>
            </div>

            <button type="submit" name="add_order" class="submit-btn">Добавить заказ</button>
        </form>
    </div>

    <!-- Список заказов -->
    <div class="section">
        <h2 class="section-title">Список заказов</h2>

        <?php if (empty($orders)): ?>
            <p>Заказов пока нет.</p>
        <?php else: ?>
            <table class="orders-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Клиент</th>
                        <th>Ответственный</th>
                        <th>Дата заказа</th>
                        <th>Дата свадьбы</th>
                        <th>Сумма</th>
                        <th>Аванс</th>
                        <th>Оплата</th>
                        <th>Статус</th>
                        <th>Примечания</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($orders as $order): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($order['OrderID']); ?></td>
                        <td>
                            <?php
                            echo htmlspecialchars($order['ClientLastName'] . ' ' . $order['ClientFirstName']);
                            echo ' (ID: ' . htmlspecialchars($order['ClientID']) . ')';
                            ?>
                        </td>
                        <td>
                            <?php
                            if ($order['EmployeeFirstName']) {
                                echo htmlspecialchars($order['EmployeeLastName'] . ' ' . $order['EmployeeFirstName']);
                                echo ' (ID: ' . htmlspecialchars($order['EmployeeID']) . ')';
                            } else {
                                echo '-';
                            }
                            ?>
                        </td>
                        <td><?php echo htmlspecialchars($order['OrderDate']); ?></td>
                        <td><?php echo htmlspecialchars($order['WeddingDate'] ?? '-'); ?></td>
                        <td class="amount"><?php echo number_format($order['TotalAmount'], 0, '', ' ') . ' руб.'; ?></td>
                        <td class="amount"><?php echo number_format($order['Deposit'], 0, '', ' ') . ' руб.'; ?></td>
                        <td class="<?php
                            if ($order['PaymentStatus'] === 'Частично') echo 'payment-partial';
                            elseif ($order['PaymentStatus'] === 'Не оплачено') echo 'payment-not-paid';
                            else echo 'payment-paid';
                        ?>">
                            <?php echo htmlspecialchars($order['PaymentStatus']); ?>
                        </td>
                        <td class="<?php
                            if ($order['OrderStatus'] === 'Новый') echo 'status-new';
                            elseif ($order['OrderStatus'] === 'В работе') echo 'status-in-work';
                            elseif ($order['OrderStatus'] === 'Завершен') echo 'status-completed';
                        ?>">
                            <?php echo htmlspecialchars($order['OrderStatus']); ?>
                        </td>
                        <td><?php echo htmlspecialchars($order['Notes'] ?? '-'); ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </div>

    <div class="nav-links">
        <a href="workplace.php" class="nav-link">← Назад в рабочее место</a>
    </div>
</body>
</html>
