library(reticulate)
use_python("/usr/bin/python3")

stopifnot(reticulate::py_module_available("retriever"))

r_data_retriever <- reticulate::import("retriever")

datasets <- r_data_retriever$dataset_names()

found <- grep("veg-plots-sdl", datasets, value = TRUE)
stopifnot(length(found) > 0)

r_data_retriever$install_csv("veg-plots-sdl", data_dir = ".")

message(paste(list.files(pattern = "^veg_plots_sdl_"), collapse = "\n"))
