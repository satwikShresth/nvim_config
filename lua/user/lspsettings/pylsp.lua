return{
  pylsp = {
        plugins = {
          jedi_completion = {enabled = true},
          jedi_hover = {enabled = true},
          jedi_references = {enabled = true},
          jedi_signature_help = {enabled = true},
          jedi_symbols = {enabled = true, all_scopes = true},
          pycodestyle = {enabled = false},
          flake8 = {
            enabled = false,
            ignore = {},
            maxLineLength = 160
          },
          mypy = {enabled = false},
          isort = {enabled = false},
          yapf = {enabled = false},
          pylint = {enabled = false},
          pydocstyle = {enabled = false},
          mccabe = {enabled = false},
          preload = {enabled = false},
          rope_completion = {enabled = true}
        }
      }
}
