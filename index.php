<?php
session_start();
require_once 'config.php';
require_once 'connect.php';
require_once 'fonctions.php';
mysqli_set_charset($mysqli, "utf8");

// récupérations des images dans la table photo
$sql = "SELECT p.lenom,p.lextension,p.ladesc,p.letitre, u.lelogin, 
    GROUP_CONCAT(r.id) AS rubid, 
    GROUP_CONCAT(r.lintitule SEPARATOR '~~') AS lintitule 
    FROM photo p
    INNER JOIN utilisateur u ON u.id = p.utilisateur_id
    LEFT JOIN photo_has_rubriques h ON h.photo_id = p.id
    LEFT JOIN rubriques r ON h.rubriques_id = r.id
    GROUP BY p.id
    ORDER BY p.id DESC;
    ";
$recup_sql = mysqli_query($mysqli,$sql) or die(mysqli_error($mysqli));      



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
    echo "<h1>Telepro-photos.fr - Accueil</h1>";
}else{
echo "<h1>Telepro-photos.fr</h1>";

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
                        }}    
      
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
</nav>
            </div>
        <div id="millieu">
            <div id="pagination">

        </div>
            <div id="lesphotos">
            <?php
                // affichez les miniatures de chaques photos dans la db par id Desc, avec le titre au dessus et la description en dessous, et affichage de la grande photo dans une nouvelle fenêtre lors du clic, Bonus : afficher lelogin de l'auteur de l'image
               while($ligne = mysqli_fetch_assoc($recup_sql)){
                 echo "<div class='miniatures'>";
                 echo "<h4>".$ligne['letitre']."</h4>";
                 echo "<a href='".CHEMIN_RACINE.$dossier_gd.$ligne['lenom'].".jpg' target='_blank'><img src='".CHEMIN_RACINE.$dossier_mini.$ligne['lenom'].".jpg' alt='' /></a><br/>";

                 echo "<p>".$ligne['ladesc']."<br /> par <strong>".$ligne['lelogin']."</strong></p>";
                 echo "</div>";
               }                
               ?> 
            </div>
        </div>
    </body>
</html>
