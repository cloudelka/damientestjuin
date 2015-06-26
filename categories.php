<?php
session_start();
require_once 'config.php';
require_once 'connect.php';

require_once 'fonctions.php';
require_once 'fonctions-pagination.php';  

 if (isset($_GET['idsection']) && ctype_digit($_GET['idsection']))
        $ajout_pagi = "WHERE rubriques_id = ".$_GET['idsection'];
$recup_nb_proverbes = "select count(*)as nb_total from photo_has_rubriques $ajout_pagi;";
// requete de récupération
$tot = mysqli_query($mysqli,$recup_nb_proverbes);
// transformation du résultat en tableau associatif
$maligne = mysqli_fetch_assoc($tot);
// variable contenant le nombre total de proverbes
$nb_total = $maligne['nb_total'];

// vÃ©rification de la variable GET de pagination
if(isset($_GET[$get_pagination])){
    // si elle est au bon format (int positif)
    if(ctype_digit($_GET[$get_pagination])){
        // rÃ©cupÃ©ration de la valeur dans l'url
        $page_actu = $_GET[$get_pagination];
    }else{ // si pas valide
       $page_actu = 1; 
    }
}else{ // si non existante
    $page_actu = 1;
}

$debut = ($page_actu -1) * $elements_par_page;
if (isset($_GET['idsection']) && ctype_digit($_GET['idsection'])){
    
    $ajout_requete = "WHERE r.id = ".$_GET['idsection'];
}else {
    $ajout_requete = "";
}

if (isset($_GET['idsection']) && ctype_digit($_GET['idsection'])){
    
    $ajout_requete = "WHERE r.id = ".$_GET['idsection'];
}else {
    $ajout_requete = "";
}



// rÃ©cupÃ©rations des images dans la table photo
$sql = "SELECT p.lenom,p.lextension,p.ladesc,p.letitre, u.lelogin, 
    
    GROUP_CONCAT(r.lintitule SEPARATOR '~~')
    FROM photo p
    INNER JOIN utilisateur u ON u.id = p.utilisateur_id
    LEFT JOIN photo_has_rubriques h ON h.photo_id = p.id
    LEFT JOIN rubriques r ON h.rubriques_id = r.id
    $ajout_requete
    GROUP BY p.id
    ORDER BY p.id DESC
    LIMIT $debut,$elements_par_page;
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
                                 // requete pour nom catÃ©gorie //
    $idsectionrub = $_GET['idsection'];
    $sqlrubrique = "SELECT * FROM rubriques WHERE id=$idsectionrub";
    $rubb = mysqli_query($mysqli,$sqlrubrique);

    $rubrr = mysqli_fetch_assoc($rubb);
////////////////////////////////
        if (!isset($_SESSION['sid']) || $_SESSION['sid'] != session_id()) {
    echo "<h1>Telepro-photos.fr - ".$rubrr['lintitule']."</h1>";
}else{
    if(!isset($_GET['idsection'])){
echo "<h1>Telepro-photos.fr</h1>";
    }else{

        echo "<h1>Telepro-photos.fr  -  ".$rubrr['lintitule']."</h1>";
    }
    
                            echo "<h3>Bonjour ".$_SESSION['lenom'].'</h3>';
                        echo "<p>Vous êtes connecté en tant que <span >".$_SESSION['nom_perm']."</span></p>";
                        echo "<h5><a href='deconnect.php'>Déconnexion</a></h5>";
                                                    switch($_SESSION['laperm']){
                            // si on est l'admin
                            case 0 :
                               echo "<a href='admin.php'>Administration</a>";
                                break;
                            // si on est modÃ©rateur
                            case 1:
                                echo "<a href='modere.php'>Modération</a> ";
                                break;
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
</nav>
            </div>
        <div id="millieu">
            <div id="pagination">
                  <?php
            echo pagination2($nb_total, $page_actu, $elements_par_page, $get_pagination)
            ?>  
        </div>
            <div id="lesphotos">
            <?php
                // affichez les miniatures de chaques photos dans la db par id Desc, avec le titre au dessus et la description en dessous, et affichage de la grande photo dans une nouvelle fenÃªtre lors du clic, Bonus : afficher lelogin de l'auteur de l'image
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
