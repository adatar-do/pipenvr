use_pipenv <- function(required = FALSE){
  is_venv_active = reticulate::py_config()[["virtualenv"]]
  if(is_venv_active == ""){
    are_venv = system("python -m pipenv --python 3.6 --venv")
    if(are_venv == 1){
      system("python -m pipenv shell --python 3.6")
    }
    venv = system("python -m pipenv --python 3.6 --venv", intern = T)
    #Sys.setenv(RETICULATE_PYTHON = venv)
  } else {
    print("virtual environment already activated. \n
          No action taken to avoid nested environments.")
  }
  return(venv)
}
