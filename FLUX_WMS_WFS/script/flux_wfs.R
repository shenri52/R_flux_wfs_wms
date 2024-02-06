# Chargement des flux WFS
list_flux <- read_xml("data/WFS.xml") %>%
             xml_find_all("//wfs")

# Extraction des noms et des URL
LIBELLE <- trimws(xml_attr(list_flux, "name"))
URL_FLUX <-  trimws(xml_attr(list_flux, "url"))
MDP <- trimws(xml_attr(list_flux, "password"))

# Assemblage
flux_WFS <- cbind(as.data.frame(LIBELLE), as.data.frame(URL_FLUX), as.data.frame(MDP)) %>%
            mutate(TYPE = "WFS") %>%
            filter(MDP == "")

