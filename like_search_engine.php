<pre><?php
require_once('connection.php');

  // main query 
  $sql = 'SELECT * FROM news WHERE 3';
  $search_terms = isset($_GET['title']) ? $_GET['title'] : 0;
  $search_terms_final = explode (" ", $search_terms);
  $n=0;
  $arr_search= array();
   
  // search engine 
  foreach($search_terms_final as $term){
    $reg= "/\w{3,}/i";
    if (  preg_match($reg, $term)){
      $sql .= " AND title like :search{$n}";
  $arr_search[":search{$n}"]= '%' . $term . '%';
    } 
    
  $n++;

  };
  // new record first
  $sql .= " ORDER BY id DESC";


  // count the records for pagination 
$statement_count = $pdo->prepare($sql);
$statement_count->execute($arr_search);
$results_counter = count($statement_count->fetchAll());

$total_rows_to_show= 5;
$total_pages_to_show= ceil($results_counter/ $total_rows_to_show);

$current_page = isset($_GET['page']) ? $_GET['page'] : 0;
$query_page = $total_rows_to_show * $current_page;


$sql .= " limit  {$query_page},{$total_rows_to_show}";



$statement = $pdo->prepare($sql);
$statement->execute($arr_search);
$results = $statement->fetchAll();
 if($search_terms == 0 ){
  $search_terms = "ex: Javascript";
}

// delete 
if(isset($_GET['delete'])){
  $sql_delete = 'delete from news where id= ? ';
  $id = isset($_GET['delete']) ? $_GET['delete'] :0 ;
  $statement_delete = $pdo->prepare($sql_delete);
  var_dump($id);
  $statement_delete->execute(array($id));
  $results = $statement_delete->fetchAll();
  header("location: like_search_engine.php");

}

?>
</pre>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>PHP & SQL</title>
<link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
<script>
  function funcDelete(id_to_delete){
    var confirmation = confirm("Are you sure do you want to delete the register number: "+ id_to_delete );
    if(confirmation){
      
      window.location= "like_search_engine.php?delete="+id_to_delete;
    }
  }

</script>
</head>
<body>
 
<div class="top-bar">
<div class="top-bar-left">
<ul class="menu">
<li class="menu-text">Course PHP & SQL</li>
<li> <a href="insert.php">New Record</a></li>
</ul>
</div>
</div>
 
<div class="row column text-center">
<h2>Crud aplication </h2>
<hr>
</div>
<div class="row column">
<div class="callout primary">
<h3>News</h3>
<form method="get">
  <div class="row">
    <div class="medium-6 columns">
      <label>Insert the Title
        <input type="text" name="title" placeholder="ej. javascript" value="<?php echo $search_terms;?>">
        <input class="button" type="submit" value="SEARCH" />
      </label>
    </div>
  </div>
</form>
</div>
<table width="100%">
  <thead>
    <tr>
      <th> Id </th>
      <th>Title</th>
      <th>Content</th>
      <th> </th>
      <th> </th>
    </tr>
  </thead>
  <tbody>
    <?php
    foreach($results as $rs)
    {
  ?>
    <tr>
      <td> <?php echo $rs['id']; ?></td>
      <td width="300"><?php echo $rs['title']; ?></td>
      <td><?php echo $rs['content']; ?></td>
      <td> <a class="button" href="update.php?id=<?php echo $rs['id']; ?>">Update</a></td>
      <td> <a class="alert button" onclick="funcDelete(<?php echo $rs['id']; ?>)" href="#">Delete</a></td>
    </tr>
    <?php
  }
    ?>
  </tbody>
</table>
</div>
<hr>

</div>
<div class="large-3 large-offset-2 columns text-center">
  <ul class="pagination text-center" role="navigation" aria-label="pagination"></ul>
  <?php for($i = 1 ; $i <= $total_pages_to_show ; $i++ ){?> 
  <a  class ="button" href="like_search_engine.php?page=<?php echo $i-1; ?> " aria-label="page <?php echo $i; ?> "><?php echo $i; ?>  </a>
  <?php } ?>
</div>
</div>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
<script>
      $(document).foundation();
    </script>
</body>
</html>
