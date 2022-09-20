<?php
require_once('connection.php');



if ($_POST){
  if ((trim($_POST['title']) == "") || (trim($_POST['content']) == "") ){
    
  }else{

  
  $sql_insert = ' INSERT INTO news(publish_date, title, content, status) VALUES (?,?,?,?) ';

  $publish_date= date('Y-m-d');
  $title = isset($_POST['title']) ? $_POST['title'] : exit();
  $content = isset($_POST['content']) ? $_POST['content'] : exit();
  $status = 1;
  
  
  $statement_insert = $pdo->prepare($sql_insert);
  $statement_insert->execute(array($publish_date, $title, $content, $status));
  $results = $statement_insert->fetchAll();
}
}

$sql = 'SELECT * FROM news WHERE 1 ORDER BY id DESC';

$statement = $pdo->prepare($sql);
$statement->execute();
$results = $statement->fetchAll();


?>

<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>PHP & SQL</title>
<link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
 
<div class="top-bar">
<div class="top-bar-left">
<ul class="menu">
<li class="menu-text">Curso PHP & SQL</li>
<li> <a href="like_search_engine.php">home</a></li>
</ul>
</div>
</div>
 
<div class="row column text-center">
<h2>INSERT</h2>
<hr>
</div>
<div class="row column">
<div class="callout secondary">
<h3>New  News</h3>
<form method="post">
  <div class="row">
    <div class="medium-6 columns">
      <label>Insert the title
        <input type="text" name="title" placeholder="ej. Javascript" value="">
        
      </label>
      <p class="help-text">The content must be clear</p>
    </div>
    <div class="medium-6 columns">
      <label>&nbsp;
        <!--<input type="text" name="title" placeholder="ej. javascript" value="">-->
        
      </label>
    </div>
  </div>
  <div class="row">
    <div class="medium-12 columns">
      <label>Insert the content
        <textarea name="content" placeholder="ej. Lorem ipsum..."></textarea>
        <input class="button primary" type="submit" value="AGREGAR" />
      </label>
      
    </div>
  </div>
</form>
</div>
<table width="100%">
  <thead>
    <tr>
      <th>ID</th>
      <th>Título</th>
      <th>Contenido</th>
    </tr>
  </thead>
  <tbody>
    <?php
    foreach($results as $rs)
    {
  ?>
    <tr>
      <td width="300"><?php echo $rs['id']; ?></td>
      <td width="300"><?php echo $rs['title']; ?></td>
      <td><?php echo $rs['content']; ?></td>
    </tr>
    <?php
  }
    ?>
  </tbody>
</table>
</div>
<hr>

</div>
<div class="large-3 large-offset-2 columns">
</div>
</div>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
<script>
      $(document).foundation();
    </script>
</body>
</html>
