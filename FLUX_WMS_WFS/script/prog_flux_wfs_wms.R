##################################################################################
# Ce programme permet de créer un tableau hmtl contenant les flux WFS et WMS     #
# exportés depuis QGIS                                                           #
##################################################################################
# Fonctionnement :                                                               #
#   1. Exporter les flux WFS et WMS de QGIS, au format xml dans le dossier       #
#   "data" :                                                                     #
#       * le fichier contenant les flux WFS doit être nommé "WFS"                #
#       * le fichier contenant les flux WMS doit être nommé "WMS"                #
#   2. Lancer le script intitulé "prog_flux_wfs_wms" qui se trouve dans le       #
#   dossier "script"                                                             #
#                                                                                #
# Résultat :                                                                     #
# Le tableau html contenant les flux se trouve dans le dossier "result" et se    #  
# nomme "index_flux.html".                                                       #
##################################################################################


#################### Chargement des librairies

source("script/librairie.R")

#################### Suppression des fichiers gitkeep

source("script/suppression_gitkeep.R")

##################### Traitement des flux WFS

source("script/flux_wfs.R")

##################### Traitement des flux WMS

source("script/flux_wms.R")

##################### Mise en forme des flux dans un tableau html

source("script/flux_tab_html.R")
