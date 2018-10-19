<?php
   header("Access-Control-Allow-Origin: *");	
	// Define database connection parameters
   $hn      = 'localhost';
   $un      = 'root';
   $pwd     = '';
   $db      = 'bloodForAll';
   $cs      = 'utf8';

   // Set up the PDO parameters
   $dsn 	= "mysql:host=" . $hn . ";port=3306;dbname=" . $db . ";charset=" . $cs;
   $opt 	= array(
                        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
                        PDO::ATTR_EMULATE_PREPARES   => false,
                       );
   //Create a PDO instance (connect to the database)
   try
   {
	   $bdd 	= new PDO($dsn, $un, $pwd, $opt);
	   $data    = array();
	   
	   $json    =  file_get_contents('php://input');
	   $obj     =  json_decode($json);
	   $key     =  strip_tags($obj->key);
	   //echo $json;
   
		switch($key)
		{
			case 'getDepartement':
				$requete=$bdd->prepare("SELECT * FROM `departement` order by(departement.nom)");
				$requete->execute();
				$data=$requete->fetchAll();
				echo json_encode($data);
			break;

			case 'getGroupe':
				$requete=$bdd->prepare("SELECT * FROM `group` order by(nom)");
				$requete->execute();
				$data=$requete->fetchAll();
				echo json_encode($data);
			break;

			case 'getGroupeSanguin':
				$requete=$bdd->prepare("SELECT * FROM `groupeSanguin` order by(groupeSanguin)");
				$requete->execute();
				$data=$requete->fetchAll();
				echo json_encode($data);
			break;

			case 'login':
				$pseudo= filter_var($obj->pseudo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
				$password= filter_var($obj->password, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
				$stmt=$bdd->query('SELECT * FROM hopital AS h, hopital_has_users AS hu, groupeSanguin AS g, users AS u WHERE h.id_hopital=hu.hopital_id AND u.idusers=hu.users_idusers AND u.groupeSanguin_id=g.id_groupeSanguin AND pseudo="'.$pseudo.'" AND password="'.$password.'"');
				if(!empty($stmt))
				{
					while($row  = $stmt->fetch(PDO::FETCH_OBJ))
					{
					   // Assign each row of data to associative array
					   $data[] = $row;
					}
		  
					// Return data as JSON
					echo json_encode($data);
				} 
				$stmt->closeCursor();
			break;
		}
	}
	catch(Exception $e)
	{
		echo $e->getMessage();
	}
?>

