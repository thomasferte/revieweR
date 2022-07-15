#' read_sas
#' 
#' @description A function to import sas data with the attributes.
#'
#' @param file The sas database file
#'
#' @return A dataframe with the data
#' @export
#'
#' @examples
#' \dontrun{
#' path_data_file <- "data.sas7bdat"
#' res <- read_sas(format_file = path_data_file)
#' }
#' 
read_sas <- function(file) {
  
  data <- haven::read_sas(file)
  
  data[] <- lapply(data, function(x) {
    if ('haven_labelled' %in% class(x)) {
      haven::as_factor(x)
    } else {
      x
    }
  })
  
  formatData <- as.data.frame(data)
  
  for (i in 1:ncol(data)) {
    attr <- attr(data[, i], 'label')
    attr(formatData[, i], 'label') <- attr
    attr(formatData[, i], 'var_label') <- attr
  }
  return(formatData)
}