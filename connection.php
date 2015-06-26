<?php
session_start();
require_once 'config.php';
require_once 'connect.php';
require_once 'fonctions.php';

if (isset($_POST['lelogin'])) {
    $lelogin = traite_chaine($_POST['lelogin']);
    $lemdp = traite_chaine($_POST['lemdp']);

    // vérification de l'utilisateur dans la db
    $sql = "SELECT  u.id, u.lemail, u.lenom, 
		d.lenom AS nom_perm, d.laperm 
	FROM utilisateur u
		INNER JOIN droit d ON u.droit_id = d.id
    WHERE u.lelogin='$lelogin' AND u.lepass = '$lemdp';";
    $requete = mysqli_query($mysqli, $sql)or die(mysqli_error($mysqli));
    $recup_user = mysqli_fetch_assoc($requete);

    // vérifier si on a récupèré un utilisateur
    if (mysqli_num_rows($requete)) { // vaut true si 1 résultat (ou plus), false si 0

        // si l'utilisateur est bien connecté

        $_SESSION = $recup_user; // transformation des résultats de la requête en variable de session
        $_SESSION['sid'] = session_id(); // récupération de la clef de session
        $_SESSION['lelogin'] = $lelogin; // récupération du login (du POST après traitement)
        // var_dump($_SESSION);
        // redirection vers la page d'accueil (pour éviter les doubles connexions par F5)
        header('location: ' . CHEMIN_RACINE);
    }
}
     

?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Accueil</title>
        <link rel="stylesheet" href="style.css" />
        <script src="monjs.js"></script>
    </head>
        <body><div id="haut">
                         <?php
        if (!isset($_SESSION['sid']) || $_SESSION['sid'] != session_id()) {
    echo "<h1>Telepro-photos.fr - Connection</h1>";
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
        <div id="content">
                <div id="connect">
                    <?php
                    // si on est pas (ou plus) connecté
                    if (!isset($_SESSION['sid']) || $_SESSION['sid'] != session_id()) {
                        ?>
                        <form action="" name="connection" method="POST">
                           Login: <input type="text" name="lelogin" required />
                           Mdp : <input type="password" name="lemdp" required />
                            <input type="submit" value="Connexion" />
                        </form>
                    <br/>
                    <a href="">Inscription</a>
                    <br/>
                    <a href="">Mot de pass perdu ?</a>
                    
                        <?php
                        // sinon on est connecté
                    }
                    ?>
                </div>
            </div>
            <div id="milieu">

            </div>
            <div id="bas"></div>
    </body>
</html>
