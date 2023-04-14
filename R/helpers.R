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
