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
   // Create a PDO instance (connect to the database)
   $pdo 	= new PDO($dsn, $un, $pwd, $opt);


   // Retrieve the posted data
   $json    =  file_get_contents('php://input');
   $obj     =  json_decode($json);
   $key     =  strip_tags($obj->key);

   switch($key)
   {
        case "create":


        $nom = filter_var($obj->nom, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $pseudo    = filter_var($obj->pseudo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $prenom          = filter_var($obj->prenom, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $num     = filter_var($obj->num, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $password           = filter_var($obj->password, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $mail   = filter_var($obj->mail, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $code   = filter_var($obj->codeHopital, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $departement   = filter_var($obj->departement, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $groupeSanguin   = filter_var($obj->groupeSanguin, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $userGroupe  = filter_var($obj->userGroupe, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        // Attempt to run PDO prepared statement
        try 
        {
            if($userGroupe==5)
            {
                $status=1;
            }
            else
            {
                $status=0;
            }
            $requete=$pdo->prepare("select id_hopital from hopital where codeHopital='".$code."'");
            $requete->execute();
            $nbHopital=$requete->rowCount();
            $idHopital=$requete->fetch();
            if($nbHopital==0)
            {
                $data['message']="Ce code hopital n'existe pas.Entrez un code valide";
            }
            else
            {
                $requete=$pdo->prepare("select idusers from users where email='".$mail."'");
                $requete->execute();
                $nbUser=$requete->rowCount();
                if($nbUser!=0)
                {
                    $data['message']="Cette adresse mail est déjà utilisée";
                }
                else
                {
                    $requete=$pdo->prepare("select idusers from users where num=".$num);
                    $requete->execute();
                    $nbUser=$requete->rowCount();
                    if($nbUser!=0)
                    {
                        $data['message']="Ce numéro est déjà utilisé";
                    }
                    else
                    {
                        
                        $sql  = "INSERT INTO users (`nom`, `prenoms`,`pseudo`,`password`, `email`, `num`,`status`, `departement_idDepartement`,`groupeSanguin_id`) 
                                VALUES(:nom, :prenom,:pseudo,:password,:mail, :num,:status,:idDepartement,:idgroupeSanguin)";
                        //$password= password_hash($password,PASSWORD_DEFAULT);
                        $stmt    = $pdo->prepare($sql);
                        $stmt->bindParam(':nom',  $nom , PDO::PARAM_STR);
                        $stmt->bindParam(':prenom', $prenom, PDO::PARAM_STR);
                        $stmt->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);
                        $stmt->bindParam(':password', $password, PDO::PARAM_STR);
                        $stmt->bindParam(':num', $num, PDO::PARAM_STR);
                        $stmt->bindParam(':status', $status, PDO::PARAM_STR);
                        $stmt->bindParam(':mail', $mail, PDO::PARAM_STR);
                        $stmt->bindParam(':idDepartement', $departement, PDO::PARAM_STR);
                        $stmt->bindParam(':idgroupeSanguin', $groupeSanguin, PDO::PARAM_STR);
                        $stmt->execute();

                        $requete=$pdo->prepare("select max(idusers) as id from users");
                        $requete->execute();
                        $idUser=$requete->fetch();
                        //echo json_encode($val);

                        $requete=$pdo->prepare("insert into users_has_group(`users_idusers`,`group_id`) values (".$idUser->id.",".$userGroupe.")");
                        $requete->execute();
                        if($userGroupe==2)
                        {
                            $requete=$pdo->prepare("insert into hopital_has_users(`hopital_id`,`hopital_codeHopital`,`users_idusers`) values (".$idHopital->id_hopital.",'".$code."',".$idUser->id.")");
                            $requete->execute();
                        }
                        $data['message']="Success";
                    
                        
                    }
                }
                
            }
        //echo json_encode(array('message' => 'Congratulations the record ' . $nom . ' was added to the database'));
        }
        // Catch any errors in running the prepared statement
        catch(PDOException $e)
        {
            $data['message']=$e;
        }
        echo json_encode($data);
        break;
    }

?>  	