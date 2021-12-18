#' Use pipenv with reticulate
#' `r lifecycle::badge('experimental')`
#' 
#'  If a pipenv environment exists, use it. Otherwise, create a new one.
#'  Set the RETICULATE_PITHON environment variable to the path of the
#'  pipenv virtual environment. This process is only done once per project.
#'
#' @param args [character] Other arguments to pass to \code{pipenv shell {{args}} }.
#'
#' @return NULL
#'
#' @export
#'
#' @examples
#' \dontrun{
#' pipenvr::use_pipenv()
#' }
use_pipenv <- function(args = "") {
  is_venv_active <- reticulate::py_config()[["virtualenv"]]
  if (is_venv_active == "") {
    create_pipenv(args)
    python <- get_python_path()
    set_env_var(python)
    message(paste0("Using pipenv virtual environment at ", python))
  } else {
    message("virtual environment already activated.
    No action taken to avoid nested environments.")
  }
}


create_pipenv <- function(args) {
  are_venv <- system("python -m pipenv --venv", intern = T)
  if (are_venv == 1) {
    if(args == ""){
    system("python -m pipenv shell")
    } else {
      system(paste0("python -m pipenv shell ", args))
    }
  }
}


get_python_path <- function() {
    venv <- system("python -m pipenv --venv", intern = T)
    suffix <- if (identical(.Platform$OS.type, "windows")) {
      "Scripts/python.exe"
    } else {
      "bin/python"
    }
    python <- paste0(
      stringr::str_remove_all(
        file.path(venv),
        "\\r"
      ),
      "\\",
      suffix
    )
    python <- stringr::str_replace_all(python, "\\\\", "/")
}


set_env_var <- function(python) {
    project <- getwd()
    #name <- basename(project)
    env_file <- paste0(project, "/", ".Renviron")
    if (!file.exists(env_file)) {
      env_cont <- paste0("RETICULATE_PYTHON=", python)
    } else {
      env_cont <- readr::read_file(env_file)
      pattern <- "RETICULATE_PYTHON=.*[Scripts/python.exe]?[bin/python]?"
      have_env <- stringr::str_detect(env_cont, pattern)
      add_env <- paste0("RETICULATE_PYTHON=", python)

      if (have_env) {
        env_cont <- stringr::str_replace(
          env_cont,
          stringr::regex(pattern),
          add_env
        )
      } else {
        env_cont <- paste0(env_cont, add_env)
      }
    }
    env_cont <- stringr::str_remove_all(env_cont, stringr::regex("^[\n\r]"))
    env_cont <- stringr::str_remove_all(env_cont, stringr::regex("[\n\r]$"))
    write(env_cont, env_file)
}
