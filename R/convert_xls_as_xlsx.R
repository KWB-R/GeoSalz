# convert_xls_as_xlsx2 ---------------------------------------------------------
convert_xls_as_xlsx2 <- function(
    xls_paths,
    input_dir,
    export_dir, 
    office_folder = kwb.geosalz:::safe_office_folder(), 
    dbg = TRUE
) 
{
  input_dir <- normalizePath(input_dir)
  
  export_dir <- normalizePath(export_dir)
  
  
  xlsx <- gsub(input_dir, export_dir, xls_paths, fixed = TRUE)
  
  xlsx <- gsub("\\.([xX][lL][sS])$", ".xlsx", xlsx)
  
  fs::dir_create(path = normalizePath(dirname(xlsx)), recursive = TRUE)
  
  exe <- normalizePath(kwb.geosalz::get_excelcnv_exe(office_folder))
  
  for (i in seq_along(xls_paths)) {
    
    kwb.geosalz:::convert_xls_to_xlsx(
      exe, 
      xls_paths[i], 
      xlsx[i], 
      i, 
      length(xls_paths), 
      dbg = dbg
    )
    
    kwb.geosalz:::delete_registry(office_folder, dbg = dbg)
  }
}