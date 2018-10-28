if(sys.info == "linux"){
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

# }else if(sys.info = "Windows"){
# 
# ## Build site
# rmarkdown::render_site(encoding = 'UTF-8')
#   
# ## Remove folders  
# # folders <- c("carousel", "clients", "testimonials")
# # folders <- glue::glue("rm -r /public/img/{folders}")
# # lapply(folders, system)
#  
#   Esse modo funcionar no windowns
#   cd public/img
#   rm -r clients carousel testimonials 
#   Porem, precisa ser automatizado como o de cima
# ==============================================================
# # Remove large and unwanted files
#   # files <- c("photogrid.svg", "texture-bw.png", "utfpr.svg")
#   # files <- glue::glue("rm public/img/{files}")
#   # lapply(files, system)
#   
#   funciona no Windowns:
#   cd public/img
#   rm -r photogrid.svg texture-bw.png utfpr.svg
#   Porem, precisa ser automatizado como o de cima  
# ==============================================================
#   Esse modo nao funciona
#   #Compress files
#
#   system2("cd public && winrar a -afzip -r upload.zip")
#
#   funciona no Windowns:
#   cd public && winrar a -afzip -r upload.zip
# ==============================================================
#  
# # Open server portal
# browseURL("http://www.suporte.cpd.ufsm.br/newftp/")
#   
# }
