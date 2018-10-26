# Build site
rmarkdown::render_site(encoding = 'UTF-8')

# Remove folders
folders <- c("carousel", "clients", "testimonials")
folders <- glue::glue("rm -r public/img/{folders}")
lapply(folders, system)

# Remove large and unwanted files
files <- c("photogrid.svg", "texture-bw.png", "utfpr.svg")
files <- glue::glue("rm public/img/{files}")
lapply(files, system)

# Compress files
system("cd public && zip -r upload.zip *")

# Open server portal
browseURL("http://www.suporte.cpd.ufsm.br/newftp/")
