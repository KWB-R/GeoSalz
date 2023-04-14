# Convert xls to xlsx Excel files
prepare_excel_files <- function(input_dir, export_dir, overwrite = TRUE)
{
  print("### Convert xls to xlsx files")  
  kwb.geosalz::convert_xls_as_xlsx(input_dir, export_dir)
  
  
  print("### Copy remaining already existing .xlsx files")
  kwb.geosalz::copy_xlsx_files(input_dir, export_dir, overwrite = overwrite)
}
