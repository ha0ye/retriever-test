library(reticulate)
use_python("/usr/bin/python3")
print(reticulate::py_config())

# check for retriever availability
stopifnot(py_module_available("retriever"))
r_data_retriever <- import("retriever")

# check for dataset availability
datasets <- r_data_retriever$dataset_names()
found <- grep("veg-plots-sdl", datasets, value = TRUE)
stopifnot(length(found) > 0)

# download files
r_data_retriever$install_csv("veg-plots-sdl", data_dir = ".")

# check for downloaded files
data_files <- list.files(pattern = "^veg_plots_sdl_")
data_folder <- list.files(pattern = "^veg-plots-sdl")
stopifnot(length(data_files) + length(data_folder) > 0)
