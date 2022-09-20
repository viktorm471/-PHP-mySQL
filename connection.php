<?php 
$dsn = 'mysql:dbname=php_sql_course; host=127.0.0.1';
$user= 'root';
$password= '';

try {
$pdo = new PDO( $dsn, $user, $password);
//  echo "connection successeful " ;
}catch(PDOexeption $e){
    echo "error to conect database" . $e ->getMessage();

}
?>