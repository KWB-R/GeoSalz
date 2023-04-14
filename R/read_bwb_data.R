# import_labor (slightly differs from kwb.geosalz::import_labor()) -------------
import_labor <- function(files, export_dir, func = kwb.geosalz::read_bwb_header2) {
  try_func_on_file <- function(file) try(func(file))
  
  labor <- stats::setNames(lapply(files, try_func_on_file), basename(files))
  
  file_name <- sprintf("%s_structure.txt", as.character(substitute(func)))
  
  file <- file.path(export_dir, file_name, fsep = "\\")
  
  capture.output(str(labor, nchar.max = 254, list.len = 10000), file = file)
  
  labor
}
