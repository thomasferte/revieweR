% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_format_to_data.R
\name{add_format_to_data}
\alias{add_format_to_data}
\title{add_format_to_data}
\usage{
add_format_to_data(df_to_format, df_format)
}
\arguments{
\item{df_to_format}{A data generated by the read_sas function.}

\item{df_format}{A format file generated by the read_format function.}
}
\value{
The df_to_format files with the added format.
}
\description{
Add format to data.
}
\examples{
\dontrun{
path_data_file <- "data.sas7bdat"
df_to_format <- read_sas(format_file = path_data_file)
path_format_file <- "formats.sas7bdat"
df_format <- read_format(format_file = path_format_file)

res <- add_format_to_data(df_to_format = df_to_format,
df_format = df_format)
}

}
