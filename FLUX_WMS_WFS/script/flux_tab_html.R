#################### Tableau html

# Assemblage des flux WFS et WMS
tab_html <- rbind(flux_WFS, flux_WMS) %>%
            select(TYPE, LIBELLE, URL_FLUX) 


# Mise en forme du tableau html
tab_html <- tab_html %>%
            datatable(
                      # Suppression d'un nom des lignes
                      rownames = FALSE,
                      # Extensions : sélection, volet de recherche et boutons
                      extensions = c("Select","Buttons","RowGroup", "SearchPanes"), 
                      selection = "none",
                      # Bordure colonne/ligne
                      class = "hover cell-border stripe",
                      # Fonctions de recherche
                      filter = list(position = "top", clear = TRUE),
                      #Nommage tableau
                      caption = tags$caption(style="caption-side: center; text-align: center; font-weight: bold; margin: 30px 0; background-color: lightblue; font-size:150%;",tab_html_nom),
                      # Nommage colonne
                      colnames = c("Type de flux", "Libellé", "Url d'accès"),
                      # Configuration des options
                      options = list(
                                     #Groupe de ligne
                                     rowGroup = list(dataSrc=c(0)),
                                     # Ordre d'affichage des élèments de l'interface
                                     dom = "fBrtlip",
                                     # Mettre en surbrillance le texte recherché
                                     searchHighlight = TRUE,
                                     # Longueur du tableau (ne sert à rien avec le scroller)
                                     pageLength = 10,
                                     # Affichage du bouton du volet de recherche
                                     buttons = list("searchPanes"),
                                     # Largeur automatique
                                     autoWidth = TRUE,
                                     # Masquer colonne theme "groupe"
                                     columnDefs = list( list(visible=FALSE, targets=c(0)),
                                                        # Masquer les colonnes non voulue dans le searchPanes
                                                        list(searchPanes = list(show = TRUE), targets = 0:0)),
                                     # Changement de la langue
                                     language = list(# Langue de la page
                                                     paginate = list(previous = "Précédent", 'next' = "Suivant"),
                                                     sLengthMenu = "Afficher _MENU_ éléments",
                                                     info = "Enregistrement _START_ à _END_",
                                                     search = "Rechercher",
                                                     # Langue du panneau de recherche
                                                     searchPanes = list(collapse = "Filtrer",
                                                                        clearMessage = "Effacer les filtres",
                                                                        collapseMessage = "Réduire tout",
                                                                        showMessage = "Afficher tout")
                                                     ),
                                     # Couleur entête
                                     initComplete = JS(
                                                       "function(settings, json) {",
                                                                                  "$(this.api().table().header()).css({'background-color': 'green', 'color': 'white'});",
                                                                                  "}")
                                     )
                      )

# Export du tableau en html et indication du titre de la page
saveWidget(tab_html, "result/index_flux.html", title = "Liste de flux WFS et WMS utilisables dans QGIS")
