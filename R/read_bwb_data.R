# Functions that are now in kwb.geosalz ----------------------------------------
read_bwb_header1_meta <- kwb.geosalz::read_bwb_header1_meta
read_bwb_header2 <- kwb.geosalz::read_bwb_header2
read_bwb_header4 <- kwb.geosalz::read_bwb_header4
read_bwb_data <- kwb.geosalz::read_bwb_data

# import_labor (slightly differs from kwb.geosalz::import_labor()) -------------
import_labor <- function(files, export_dir, func = read_bwb_header2) {
  try_func_on_file <- function(file) try(func(file))
  
  labor <- stats::setNames(lapply(files, try_func_on_file), basename(files))
  
  file_name <- sprintf("%s_structure.txt", as.character(substitute(func)))
  
  file <- file.path(export_dir, file_name, fsep = "\\")
  
  capture.output(str(labor, nchar.max = 254, list.len = 10000), file = file)
  
  labor
}
