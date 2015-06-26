<?php
session_start();
require_once 'config.php';
require_once 'connect.php';
require_once 'fonctions.php';
require_once 'fonctions-pagination.php';


$recupmail = "SELECT lemail FROM utilisateur WHERE id=1";
$recupmail2 = mysqli_query ($mysqli,$recupmail);
$recupmail3 = mysqli_fetch_assoc($recupmail2);

if (isset($_POST['nom'])) {
    $nom = strip_tags(trim($_POST['nom']));
    $titre = strip_tags(trim($_POST['titre']));
    $mail = strip_tags(trim($_POST['lemail']));
    $texte = strip_tags(trim($_POST['lemessage']));
    $monmail = $recupmail3['lemail'];
    $entete = 'From: '.$mail."\r\n".'Reply-To: '.$mail."\r\n".'X-Mailer: PHP/'.phpversion();
    if(mail($monmail, $nom, $titre, $texte,$entete))
    
    
     {
          echo 'Le message a bien été envoyé';
     }
     else
     {
          echo 'Le message n\'a pu être envoyé';
     } 
    
    
    
    
    
}




?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Accueil</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body><div id="haut">
                
                        <?php
        if (!isset($_SESSION['sid']) || $_SESSION['sid'] != session_id()) {
    echo "<h1>Telepro-photos.fr - Nous contacter</h1>";
}else{
    echo "<h1>Telepro-photos.fr - Nous contacter</h1>";
                            echo "<h3>Bonjour ".$_SESSION['lenom'].'</h3>';
                        echo "<p>Vous êtes connecté en tant que <span >".$_SESSION['nom_perm']."</span></p>";
                        echo "<h5><a href='deconnect.php'>Déconnexion</a></h5>";
                                                    switch($_SESSION['laperm']){
                            // si on est l'admin
                            case 0 :
                               echo "<a href='admin.php'>Administration</a>";
                                break;
                            // si on est modérateur
                            case 1:
                                echo "<a href='modere.php'>Modération</a> ";
                                break;
                            // si autre droit (ici simple utilisateur)
                            default :
                                echo "<a href='client.php'>Espace membre</a>";
                        }
    
}
        
        ?>
        <nav id="menu">
        <ul>
             <li><a href="index.php">Accueil</a></li>            
             <li><a>Catégories</a>
                    <ul>         
                        <?php
                        $sqlr = "SELECT * FROM rubriques";
    $q = mysqli_query($mysqli,$sqlr);


    while($r = mysqli_fetch_assoc($q))
    {
    echo "<li><a href='categories.php?idsection=".$r['id']."'>".$r['lintitule']."</a></li>";
    }

                                         ?>
                    </ul>
 </li>
            <li><a href="contact.php">Nous contacter</a></li>
            <li><a href="client.php">Espace Client</a></li>
       </ul>
</nav></div>
        
       
                    <div id="contactformu">
                        
                <form name="monform" method="POST">
                <input name="nom" type="text" placeholder="Nom" /><br/>
                <input name="titre" type="text" placeholder="Titre" /><br/>
                <input  name="lemail" type="email" placeholder="Votre adresse mail" required /><br/>
                <textarea  name="lemessage" placeholder="Votre message" maxlength="500" required></textarea> <br/>
                <input type="submit" value="Envoyer"/>
                
            </form>
      </div>   
 
        
        
        
    </body>
</html>
