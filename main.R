
reticulate::py_module_available("retriever")

r_data_retriever <- reticulate::import("retriever")

datasets <- r_data_retriever$datasets()

message(lapply(datasets, as.character))

r_data_retriever$install_csv("veg-plots-sdl", data_dir = ".")

message(paste(list.files(pattern = "^veg_plots_sdl_"), collapse = "\n"))
