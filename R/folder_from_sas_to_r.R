#' folder_from_sas_to_r
#' 
#' @description Import the whole folder and apply format file to it.
#'
#' @param path_folder The data folder path.
#' @param format_file The format file.
#'
#' @return A list of the datamanaged files.
#' @export
#' @importFrom rlang .data
#'
#' @examples
#' \dontrun{
#' path_folder <- "folder_data/"
#' format_file <- "formats.sas7bdat"
#' 
#' res <- folder_from_sas_to_r(path_folder = path_folder,
#' format_file = format_file)
#' }
#' 
folder_from_sas_to_r <- function(path_folder,
                                 format_file){
  ### import raw data
  ls_raw_data <- read_folder_sas(path_folder = path_folder,
                                 format_file = format_file)
  ### import format file
  df_format <- read_format(format_file = paste0(path_folder, format_file))
  
  ### apply format to raw data
  lsResFormat <- lapply(ls_raw_data,
                        function(x) add_format_to_data(df_to_format = x,
                                                       df_format = df_format))
  
  return(lsResFormat)
}