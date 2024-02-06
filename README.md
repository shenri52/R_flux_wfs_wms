# Script R : flux_wfs_wms

Ce script permet de créer un tableau hmtl contenant les flux WFS et WMS exportés depuis QGIS.

## Descriptif du contenu

* Racine : emplacement du projet R --> "FLUX_WMS_WFS.Rproj"
* Un dossier "data" pour le stockage des fichiers xml contenant les flux
* Un dossier "result" pour le stockage du résultat
* Un dosssier script qui contient :
  * prog_flux_wfs_wms.R --> script principal
  * librairie.R --> script contenant les librairies utiles au programme
  * flux_wfs.R --> script de traitement des flux WFS
  * flux_wms.R --> script de traitement des flux WMS
  * fluw_tab_html.R --> script de mise en forme du tableau html
  * suppression_gitkeep.R --> script de suppression des .gitkeep

## Fonctionnement

1. Exporter les flux WFS et WMS de QGIS, au format xml, dans le dossier "data" :
       * le fichier contenant les flux WFS doit être nommé "WFS"
       * le fichier contenant les flux WMS doit être nommé "WMS"
2. Lancer le script intitulé "prog_flux_wfs_wms" qui se trouve dans le dossier "script"

## Résultat

Le tableau html contenant les flux se trouve dans le dossier "result" et se nomme "index_flux.html".
