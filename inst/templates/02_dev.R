# Build an aoc package to work through your solutions
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev script before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
#
#
########################################
#### CURRENT FILE: ON DEV SCRIPT #####
########################################

## Dependencies ----
## Add one line by package you want to add as dependency
# usethis::use_package( "dplyr" )
# usethis::use_package( "readr" )

# Use pipe ----
usethis::use_pipe(export = TRUE)

## Use cookie file ----
## Store your aoc cookie in file named .aoccookie
## use_day() will automatically use this cookie when downloading puzzle input.
# add .aoccookie file to your gitignore dotfile
usethis::use_git_ignore(".aoccookie")

## Setup each aoc day as you work ----
## aoc::use_day(1) creates R/day01.R, tests/testthat/test-day01.R,
## inst/input01.txt, and inst/run-day01.R
aoc::use_day(1)

# Enter each day's solutions ----
rstudioapi::navigateToFile( "R/data-solutions.R" )

# Document your progress in your README.Rmd ----
rstudioapi::navigateToFile( "README.Rmd" )

# Setup Github ----
usethis::use_github()
