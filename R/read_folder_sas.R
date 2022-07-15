#' read_folder_sas
#' 
#' @description A function to read all sas tables from a folder.
#'
#' @param path_folder The path folder (only .sas7bat files will be imported).
#' @param format_file The format file to excluded.
#'
#' @return A list of dataframe of the tables included inside the file.
#' @export
#'
#' @examples
#' \dontrun{
#' path_data_folder <- "folder_data/"
#' res <- read_sas(format_file = path_data_folder)
#' }
#' 
read_folder_sas <- function(path_folder,
                            format_file = "formats.sas7bdat"){
  ## find files
  vecFiles = list.files(
    path = path_folder,
    pattern = "*.sas7bdat",
    all.files = T,
    full.names = F
  )
  ## remove format file
  vecFiles <- vecFiles[vecFiles != format_file]
  
  ## load data
  lsRes <- lapply(
    vecFiles,
    FUN = function(path_file) {
      table_hope <- revieweR::read_sas(file = paste0(path_folder, path_file))
    }
  )
  names(lsRes) <- gsub(vecFiles, pattern = "\\..*", replacement = "")
  
  return(lsRes)
}