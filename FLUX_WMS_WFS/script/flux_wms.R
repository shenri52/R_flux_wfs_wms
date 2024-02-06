# Chargement des flux WFS
list_flux <- read_xml("data/WMS.xml") %>%
             xml_find_all("//wms")

# Extraction des noms et des URL
LIBELLE <- trimws(xml_attr(list_flux, "name"))
URL_FLUX <-  trimws(xml_attr(list_flux, "url"))
MDP <- trimws(xml_attr(list_flux, "password"))

# Assemblage
flux_WMS <- cbind(as.data.frame(LIBELLE), as.data.frame(URL_FLUX), as.data.frame(MDP)) %>%
            mutate(TYPE = "WMS") %>%
            filter(MDP == "")
