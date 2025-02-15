% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-usethis.R
\name{use_day}
\alias{use_day}
\alias{download_part2_to_roxygen_md}
\alias{convert_clipboard_html_to_roxygen_md}
\title{Create the files for an Advent of Code day}
\usage{
use_day(day, year = NULL, open = interactive(), cookie = NULL, package = NULL)

download_part2_to_roxygen_md(day, year = NULL, cookie = TRUE, clip = TRUE)

convert_clipboard_html_to_roxygen_md(input = clipr::read_clip())
}
\arguments{
\item{day}{integer giving the day}

\item{year}{year of Advent of Code containing the day. Defaults to
\code{getOption("aoc.year")} and then current year.}

\item{open}{whether to open the created files. Defaults to \code{TRUE} in an
interactive R session.}

\item{cookie}{whether to try to download personalized page results using an
Advent of Code cookie}

\item{package}{name of the package for the Advent of Code project. Defaults
to \code{getOption("aoc.package")} then \code{adventofcodeXX} where \code{XX} are the last
two digits of the current year.}

\item{clip}{For \code{download_part2_to_roxygen_md()}, whether to paste the puzzle
description to the user clipboard.}

\item{input}{html code copied from the Advent of Code website}
}
\value{
\code{use_day()} returns \code{NULL}. \code{convert_clipboard_html_to_roxygen_md()}
invisibly returns the Roxygen markdown block. It also copies Roxygen
markdown block onto the clipboard.
}
\description{
Create the files for an Advent of Code day
}
\details{
Creates a file for writing the functions to solve the problem: \code{R/dayxx.R}.
The text of the challenge is downloaded and inserted into the roxygen block.
One caveat is that you will have to manually add the markdown text for Part
Two yourself. You can use \code{convert_clipboard_html_to_roxygen_md()} to make
this easier. Once you can read the description, view the page source, copy
the html for that part of the problem. Run this function to create a Roxygen
version of the HTML.

Also, creates a placeholder file for the problem input: \code{inst/inputxx.txt}.
Paste your input here.

Also, creates a file for unit tests: \code{tests/testthat/test-dayxx.R}. This is
good place to test that the examples in the problem description work.

Finally, creates a solution file: \code{inst/run-dayxx.R}. You should download
your personalized challenge input as \code{inst/inputxx.txt}. Your solution file
should read in this file and apply your functions to it. Once your solution
passes on the site, store it in \code{R/data-solutions.R}. Then the solution file
can load in your previous answer, rerun your solution, and check whether your
code no longer obtains the same solution.
}
