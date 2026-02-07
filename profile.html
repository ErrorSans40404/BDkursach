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

// Получение данных пользователя
$user = null;
$error = '';
$success = '';

try {
    $stmt = $pdo->prepare("SELECT FirstName, LastName, Email, Phone, Salary, Position, HireDate FROM employees WHERE EmployeeID = :id");
    $stmt->execute([':id' => $_SESSION['user_id']]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        $error = 'Пользователь не найден';
    }
} catch(PDOException $e) {
    $error = 'Ошибка при загрузке данных: ' . $e->getMessage();
}

// Обработка обновления данных
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $phone = trim($_POST['phone'] ?? '');

    if (empty($email) || empty($phone)) {
        $error = 'Email и телефон обязательны для заполнения';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = 'Введите корректный email адрес';
    } else {
        try {
            // Проверяем, не занят ли email другим пользователем
            $stmt = $pdo->prepare("SELECT EmployeeID FROM employees WHERE Email = :email AND EmployeeID != :id");
            $stmt->execute([
                ':email' => $email,
                ':id' => $_SESSION['user_id']
            ]);

            if ($stmt->fetch()) {
                $error = 'Этот email уже используется другим пользователем';
            } else {
                // Обновляем данные
                $stmt = $pdo->prepare("UPDATE employees SET Email = :email, Phone = :phone WHERE EmployeeID = :id");
                $stmt->execute([
                    ':email' => $email,
                    ':phone' => $phone,
                    ':id' => $_SESSION['user_id']
                ]);

                // Обновляем данные в сессии
                $_SESSION['user_email'] = $email;
                $user['Email'] = $email;
                $user['Phone'] = $phone;

                $success = 'Данные успешно обновлены!';
            }
        } catch(PDOException $e) {
            $error = 'Ошибка при обновлении данных: ' . $e->getMessage();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Профиль сотрудника - Свадебный салон</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #FFF5F7;
            color: #333;
            line-height: 1.6;
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            background: linear-gradient(135deg, #FFB6C1, #FF69B4);
            padding: 25px 0;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 4px 15px rgba(255, 105, 180, 0.2);
            margin-bottom: 40px;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            text-align: center;
        }

        h1 {
            color: white;
            font-size: 2rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .logout-btn {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid white;
            padding: 10px 25px;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .logout-btn:hover {
            background: white;
            color: #FF69B4;
        }

        .profile-container {
            background-color: white;
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 10px 30px rgba(255, 105, 180, 0.15);
            border-top: 5px solid #FF69B4;
        }

        .welcome-message {
            text-align: center;
            margin-bottom: 30px;
        }

        .welcome-message h2 {
            color: #FF69B4;
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .welcome-message p {
            color: #666;
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            color: #555;
            margin-bottom: 8px;
            font-weight: 500;
            font-size: 1rem;
        }

        .readonly-field {
            background-color: #f9f9f9;
            border: 2px solid #e0e0e0;
            color: #666;
            padding: 12px 15px;
            border-radius: 10px;
            font-size: 1rem;
            width: 100%;
        }

        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #FFB6C1;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: #FF69B4;
        }

        .salary-amount {
            color: #FF69B4;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .submit-btn {
            background: linear-gradient(to right, #FFB6C1, #FF69B4);
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .submit-btn:hover {
            background: linear-gradient(to right, #FF69B4, #FF1493);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 105, 180, 0.3);
        }

        .message {
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
            text-align: center;
        }

        .error {
            background-color: #FFE4E9;
            color: #FF3366;
            border: 1px solid #FFB6C1;
        }

        .success {
            background-color: #E8FFE8;
            color: #33CC33;
            border: 1px solid #B6FFB6;
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            color: #FF69B4;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        .info-text {
            font-size: 0.9rem;
            color: #888;
            margin-top: 5px;
            font-style: italic;
        }

        .user-info {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }

        .info-item {
            flex: 1;
            min-width: 200px;
        }

        .info-label {
            color: #888;
            font-size: 0.9rem;
            margin-bottom: 5px;
        }

        .info-value {
            color: #333;
            font-size: 1.1rem;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <h1>Свадебный салон - Личный кабинет</h1>
                <a href="logout.php" class="logout-btn">Выйти</a>
            </div>
        </div>
    </header>

    <div class="container">
        <div class="profile-container">
            <?php if ($user): ?>
                <div class="welcome-message">
                    <h2>Добро пожаловать, <?php echo htmlspecialchars($user['FirstName'] . ' ' . $user['LastName']); ?>!</h2>
                    <p>Ваш профиль сотрудника</p>
                </div>

                <div class="user-info">
                    <div class="info-item">
                        <div class="info-label">Должность</div>
                        <div class="info-value"><?php echo htmlspecialchars($user['Position']); ?></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Дата найма</div>
                        <div class="info-value"><?php echo htmlspecialchars($user['HireDate']); ?></div>
                    </div>
                </div>

                <?php if ($error): ?>
                    <div class="message error"><?php echo htmlspecialchars($error); ?></div>
                <?php endif; ?>

                <?php if ($success): ?>
                    <div class="message success"><?php echo htmlspecialchars($success); ?></div>
                <?php endif; ?>

                <form method="POST" action="">
                    <div class="form-group">
                        <label>Имя</label>
                        <div class="readonly-field">
                            <?php echo htmlspecialchars($user['FirstName']); ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Фамилия</label>
                        <div class="readonly-field">
                            <?php echo htmlspecialchars($user['LastName']); ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">Электронная почта *</label>
                        <input type="email" id="email" name="email" required
                               value="<?php echo htmlspecialchars($user['Email']); ?>">
                    </div>

                    <div class="form-group">
                        <label for="phone">Номер телефона *</label>
                        <input type="tel" id="phone" name="phone" required
                               pattern="[\+]{0,1}[0-9\s\-\(\)]+"
                               placeholder="+79101112233"
                               value="<?php echo htmlspecialchars($user['Phone']); ?>">
                    </div>

                    <div class="form-group">
                        <label>Зарплата</label>
                        <div class="readonly-field salary-amount">
                            <?php echo number_format($user['Salary'], 2, '.', ' ') . ' руб.'; ?>
                        </div>
                        <div class="info-text">Зарплата устанавливается администрацией и не может быть изменена самостоятельно</div>
                    </div>

                    <button type="submit" class="submit-btn">Сохранить изменения</button>
                </form>

                <div class="back-link">
                    <a href="workplace.php">← Перейти на рабочее место</a>
                </div>

            <?php else: ?>
                <div class="message error">
                    <?php echo htmlspecialchars($error); ?>
                    <p><a href="login.php">Войти в систему</a></p>
                </div>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
