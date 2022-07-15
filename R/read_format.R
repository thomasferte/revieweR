#' read_format
#' 
#' @description Function to read a SAS format file
#'
#' @param format_file The path to format file
#'
#' @return The sas format table
#' @export
#'
#' @examples
#' \dontrun{
#' path_format_file <- "formats.sas7bdat"
#' res <- read_format(format_file = path_format_file)
#' }
#' 
read_format <- function(format_file) {
  format <- haven::read_sas(format_file)
  
  result <- base::data.frame(
    Variable = base::tolower(stringr::str_remove(string = format$FMTNAME, '_$')),
    Modality = base::trimws(format$START),
    Label = format$LABEL,
    stringsAsFactors = FALSE
  )
  return(result)
}
