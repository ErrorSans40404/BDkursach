<?php
session_start();

// Подключение к базе данных
$host = 'localhost';
$dbname = 'weddingsalondb';
$username = 'root'; // Измените на вашего пользователя БД
$password = ''; // Измените на ваш пароль БД

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Ошибка подключения к базе данных: " . $e->getMessage());
}

$error = '';
$success = '';

// Обработка формы входа
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password_input = trim($_POST['password'] ?? '');

    // Валидация
    if (empty($email) || empty($password_input)) {
        $error = 'Все поля обязательны для заполнения';
    } elseif (strlen($password_input) > 16) {
        $error = 'Пароль не должен превышать 16 символов';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = 'Введите корректный email адрес';
    } else {
        // Поиск пользователя в базе данных
        try {
            // Используем правильные имена столбцов из вашей таблицы
            $stmt = $pdo->prepare("SELECT EmployeeID, Email, password, FirstName, LastName FROM employees WHERE Email = :email");
            $stmt->execute([':email' => $email]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user) {
                // Проверка пароля
                if ($user['password'] === $password_input) {
                    // Успешный вход
                    $_SESSION['user_id'] = $user['EmployeeID'];
                    $_SESSION['user_email'] = $user['Email'];
                    $_SESSION['user_name'] = $user['FirstName'] . ' ' . $user['LastName'];
                    $success = 'Вход выполнен успешно!';

                    // Перенаправление на защищенную страницу
                    header('Location: profile.php');
                    exit();
                } else {
                    $error = 'Неверный пароль';
                }
            } else {
                $error = 'Пользователь с таким email не найден';
            }
        } catch(PDOException $e) {
            $error = 'Ошибка при проверке данных: ' . $e->getMessage();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход в систему - Свадебный салон</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #FFF5F7;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: white;
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 30px rgba(255, 105, 180, 0.15);
            border-top: 5px solid #FF69B4;
        }

        h1 {
            color: #FF69B4;
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.8rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            color: #555;
            margin-bottom: 8px;
            font-weight: 500;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #FFB6C1;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #FF69B4;
        }

        input[type="password"] {
            letter-spacing: 1px;
        }

        .char-count {
            font-size: 0.85rem;
            color: #999;
            text-align: right;
            margin-top: 5px;
        }

        .submit-btn {
            background: linear-gradient(to right, #FFB6C1, #FF69B4);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background: linear-gradient(to right, #FF69B4, #FF1493);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 105, 180, 0.3);
        }

        .message {
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 20px;
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
            margin-top: 20px;
        }

        .back-link a {
            color: #FF69B4;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        .password-info {
            font-size: 0.85rem;
            color: #888;
            margin-top: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Вход в систему</h1>

        <?php if ($error): ?>
            <div class="message error"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>

        <?php if ($success): ?>
            <div class="message success"><?php echo htmlspecialchars($success); ?></div>
        <?php endif; ?>

        <form method="POST" action="">
            <div class="form-group">
                <label for="email">Электронная почта</label>
                <input type="email" id="email" name="email" required
                       value="<?php echo htmlspecialchars($_POST['email'] ?? ''); ?>">
            </div>

            <div class="form-group">
                <label for="password">Пароль</label>
                <input type="password" id="password" name="password"
                       maxlength="16" required
                       oninput="updateCharCount(this)">
                <div class="char-count">
                    <span id="charCount">0</span>/16 символов
                </div>
            </div>

            <div class="password-info">
                Пароль должен содержать не более 16 символов
            </div>

            <button type="submit" class="submit-btn">Войти</button>
        </form>

        <div class="back-link">
            <a href="index.php">← Вернуться на главную</a>
        </div>
    </div>

    <script>
        function updateCharCount(input) {
            const charCount = document.getElementById('charCount');
            charCount.textContent = input.value.length;

            // Изменение цвета при приближении к лимиту
            if (input.value.length > 14) {
                charCount.style.color = '#FF3366';
                charCount.style.fontWeight = 'bold';
            } else if (input.value.length > 12) {
                charCount.style.color = '#FF9933';
            } else {
                charCount.style.color = '#999';
                charCount.style.fontWeight = 'normal';
            }
        }

        // Инициализация счетчика при загрузке
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password');
            updateCharCount(passwordInput);
        });
    </script>
</body>
</html>
