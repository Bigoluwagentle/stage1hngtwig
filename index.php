<?php
require_once __DIR__ . '/vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/templates');
$twig = new \Twig\Environment($loader, [
    'cache' => false,
]);

$page = $_GET['page'] ?? 'landingpage';

switch ($page) {
    case 'landingpage':
        echo $twig->render('landingpage.twig');
        break;

    case 'login':
        echo $twig->render('login.twig');
        break;

    case 'signup':
        echo $twig->render('signup.twig');
        break;

    case 'dashboard':
        echo $twig->render('dashboard.twig');
        break;

    case 'ticket':
        echo $twig->render('ticket.twig');
        break;

    case 'ticketlist':
        echo $twig->render('ticketlist.twig');
        break;

    case 'mobile':
        echo $twig->render('mobile.twig');
        break;

    default:
        echo $twig->render('404.twig', ['page' => htmlspecialchars($page)]);
        break;
}
?>
