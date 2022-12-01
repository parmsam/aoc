#' Create package for Advent of Code work
#'
#' @param path Name of the folder to create the package in.
#'     This will also be used as the package name.
#' @param check_name Should we check that the package name is
#'     correct according to CRAN requirements.
#' @param open Boolean. Open the created project?
#' @param overwrite Boolean. Should the already existing project be overwritten?
#' @param package_name Package name to use. By default uses
#'     `basename(path)`. If `path == '.'` & `package_name` is
#'     not explicitly set, then `basename(getwd())` will be used.
#'
#' @details
#'
#' Creates a package skeleton to work on Advent of Code.
#'
#' See `aoc::use_day()` function details (`?aoc::use_day()`) for more info on
#' primary package function. Function based on `golem::create_golem()`
#' (https://github.com/ThinkR-open/golem).
#' @export

create_aoc <- function(
  path,
  check_name = TRUE,
  open = TRUE,
  overwrite = FALSE,
  package_name = basename(path)
  ) {
  path_to_aoc <- normalizePath(
    path,
    mustWork = FALSE
  )

  if (check_name) {
    cli::cat_rule("Checking package name")
    utils::getFromNamespace("check_package_name", "usethis")(package_name)
    cat_green_tick("Valid package name")
  }

  if (fs::dir_exists(path_to_aoc)) {
    if (!isTRUE(overwrite)) {
      stop(
        paste(
          "Project directory already exists. \n",
          "Set `create_aoc(overwrite = TRUE)` to overwrite anyway.\n",
          "Be careful this will restore a brand new aoc project. \n",
          "You might be at risk of losing your work!"
        ),
        call. = FALSE
      )
    } else {
      cat_red_bullet("Overwriting existing project.")
    }
  } else {
    cli::cat_rule("Creating package dir")
    usethis::create_package(
      path = path_to_aoc,
      open = FALSE
    )
    here::set_here(path_to_aoc)
    cat_green_tick("Created package directory")
  }

  cli::cat_rule("Copying package skeleton")
  from <- pkg_sys("")

  # Copy over dev folder files
  fs::dir_create(
    path = file.path(path_to_aoc, "dev")
  )

  fs::file_copy(
      path = file.path(from, "templates", "01_start.R"),
      new_path = file.path(path_to_aoc, "dev","01_start.R"),
      overwrite = overwrite
  )

  fs::file_copy(
      path = file.path(from, "templates", "02_dev.R"),
      new_path = file.path(path_to_aoc, "dev","02_dev.R"),
      overwrite = overwrite
  )

  cat_green_tick("Copied app skeleton")

  cli::cat_rule("Done")

  cli::cat_line(
    paste0(
      "New aoc package named ",
      package_name,
      " was created at ",
      path_to_aoc,
      " .\n",
      "To continue working on your app, start editing the dev/01_start.R file."
    )
  )

  if (isTRUE(open)) {
    if (rstudioapi::isAvailable() & rstudioapi::hasFun("openProject")) {
      rstudioapi::openProject(path = path)
    } else {
      setwd(path)
    }
  }

  return(
    invisible(
      path_to_aoc
    )
  )
}

#' @importFrom cli cat_bullet
cat_green_tick <- function(...) {
  cli::cat_bullet(
    ...,
    bullet = "tick",
    bullet_col = "green"
  )
}

#' @importFrom cli cat_bullet
cat_red_bullet <- function(...) {
  cli::cat_bullet(
    ...,
    bullet = "bullet",
    bullet_col = "red"
  )
}

pkg_sys <- function(
    ...,
    lib.loc = NULL,
    mustWork = FALSE,
    package = "aoc"
) {
  system.file(
    ...,
    package = package,
    lib.loc = lib.loc,
    mustWork = mustWork
  )
}
