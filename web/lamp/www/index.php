<?php
// ─── LAMP Stack — Dev Environment ────────────────────────────
$host     = 'mysql';
$db       = 'lampdb';
$user     = 'admin';
$password = 'admin';

$connected = false;
try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $password);
    $connected = true;
} catch (PDOException $e) {
    $error = $e->getMessage();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>LAMP Stack</title>
  <style>
    body { font-family: monospace; background: #1e1e1e; color: #d4d4d4; padding: 2rem; }
    h1   { color: #569cd6; }
    .ok  { color: #4ec9b0; }
    .err { color: #f44747; }
    table { border-collapse: collapse; margin-top: 1rem; }
    td, th { border: 1px solid #444; padding: 0.4rem 1rem; }
    th { color: #569cd6; }
  </style>
</head>
<body>
  <h1>LAMP Stack</h1>
  <table>
    <tr><th>Component</th><th>Status</th><th>Detail</th></tr>
    <tr>
      <td>PHP</td>
      <td class="ok">OK</td>
      <td><?= phpversion() ?></td>
    </tr>
    <tr>
      <td>Apache</td>
      <td class="ok">OK</td>
      <td><?= $_SERVER['SERVER_SOFTWARE'] ?? 'apache' ?></td>
    </tr>
    <tr>
      <td>MySQL</td>
      <td class="<?= $connected ? 'ok' : 'err' ?>"><?= $connected ? 'OK' : 'ERROR' ?></td>
      <td><?= $connected ? "Connected to $db@$host" : ($error ?? '') ?></td>
    </tr>
  </table>
  <p style="margin-top:1.5rem; color:#858585;">Place your PHP files in <code>web/lamp/www/</code></p>
</body>
</html>
