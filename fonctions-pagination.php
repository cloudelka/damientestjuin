<?php   
function pagination2($total, $page_actu = 1, $par_pg = 5 ,$var_get ="idsection",$var_get = "pg") {
    $mysqli = mysqli_connect(DB_SERVER,DB_USER,DB_MDP,DB_NAME);
    if (isset($_GET['idsection']) && ctype_digit($_GET['idsection'])){
        $ajout_pagi = "WHERE rubriques_id = ".$_GET['idsection'];
    $recup_nb_proverbes = "select count(*)as nb_total from photo_has_rubriques $ajout_pagi;";
    
    }
// requete de récupération
$tot = mysqli_query($mysqli,$recup_nb_proverbes);
// transformation du résultat en tableau associatif
$maligne = mysqli_fetch_assoc($tot);
    $nombre_pg = ceil($total / $par_pg);
    if ($nombre_pg > 1) {
        $sortie = "Page ";
        for ($i = 1; $i <= $nombre_pg; $i++) {
            if ($i == 1) {
                if ($i == $page_actu) {
                    $sortie.= "<< < ";
                } else {
                    $sortie.= "<a href='?idsection=".$_GET['idsection']."&$var_get=$i'><<</a> <a href='?idsection=".$_GET['idsection']."&$var_get=" . ($page_actu - 1) . "'><</a> ";
                }
            }
            if ($i != $page_actu) {
                $sortie .= "<a href='?idsection=".$_GET['idsection']."&$var_get=$i'>$i</a>";
            } else {
                $sortie .= " $i ";
            }
            if ($i != $nombre_pg) {
                $sortie.= " - ";
            } else {
                if ($i == $page_actu) {
                    $sortie.=" > >>";
                } else {
                    $sortie.= " <a href='?idsection=".$_GET['idsection']."&$var_get=" . ($page_actu + 1) . "'>></a> <a href='?idsection=".$_GET['idsection']."&$var_get=$nombre_pg'>>></a> ";
                }
            }
        }
        return $sortie;
    } else {
        return "Page 1";
    }
}
