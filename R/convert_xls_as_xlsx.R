# Functions that are now in kwb.geosalz ----------------------------------------
get_excelcnv_exe <- kwb.geosalz::get_excelcnv_exe
safe_office_folder <- kwb.geosalz:::safe_office_folder
delete_registry <- kwb.geosalz:::delete_registry
convert_xls_as_xlsx <- kwb.geosalz::convert_xls_as_xlsx
convert_xls_to_xlsx <- kwb.geosalz:::convert_xls_to_xlsx

# get_file_paths_with_pattern --------------------------------------------------
get_file_paths_with_pattern <- function(
    input_dir, 
    pattern = "\\.([xX][lL][sS])$"
) 
{
  input_dir <- normalizePath(input_dir)
  
  normalizePath(dir(
    input_dir, pattern,
    recursive = TRUE, full.names = TRUE
  ))
}

# get_xls_file_paths -----------------------------------------------------------
get_xls_file_paths <- function(input_dir, pattern = "\\.([xX][lL][sS])$")
{
  get_file_paths_with_pattern(input_dir, pattern)
}

# get_xlsx_file_paths ----------------------------------------------------------
get_xlsx_file_paths <- function(input_dir, pattern = "\\.([xX][lL][sS][xX])$")
{
  get_file_paths_with_pattern(input_dir, pattern)
}

convert_xls_as_xlsx2 <- function(
    xls_paths,
    input_dir,
    export_dir, 
    office_folder = safe_office_folder(), 
    dbg = TRUE
) 
{
  input_dir <- normalizePath(input_dir)
  
  export_dir <- normalizePath(export_dir)
  
  
  xlsx <- gsub(input_dir, export_dir, xls_paths, fixed = TRUE)
  
  xlsx <- gsub("\\.([xX][lL][sS])$", ".xlsx", xlsx)
  
  fs::dir_create(path = normalizePath(dirname(xlsx)), recursive = TRUE)
  
  exe <- normalizePath(get_excelcnv_exe(office_folder))
  
  for (i in seq_along(xls_paths)) {
    convert_xls_to_xlsx(exe, xls_paths[i], xlsx[i], i, length(xls_paths), dbg = dbg)
    
    delete_registry(office_folder, dbg = dbg)
  }
}