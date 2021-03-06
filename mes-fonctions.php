<?php
// PAGINATION //
function pagination($total, $page_actu = 1, $par_pg = 5, $var_get = "pg") {
    $nombre_pg = ceil($total / $par_pg);
    if ($nombre_pg > 1) {
        $sortie = "Page ";
        for ($i = 1; $i <= $nombre_pg; $i++) {
            if ($i == 1) {
                if ($i == $page_actu) {
                    $sortie.= "<< < ";
                } else {
                    $sortie.= "<a href='?$var_get=$i'><<</a> <a href='?$var_get=" . ($page_actu - 1) . "'><</a> ";
                }
            }
            if ($i != $page_actu) {
                $sortie .= "<a href='?$var_get=$i'>$i</a>";
            } else {
                $sortie .= " $i ";
            }
            if ($i != $nombre_pg) {
                $sortie.= " - ";
            } else {
                if ($i == $page_actu) {
                    $sortie.=" > >>";
                } else {
                    $sortie.= " <a href='?$var_get=" . ($page_actu + 1) . "'>></a> <a href='?$var_get=$nombre_pg'>>></a> ";
                }
            }
        }
        return $sortie;
    } else {
        return "Page 1";
    }
}
// PAGINATION //