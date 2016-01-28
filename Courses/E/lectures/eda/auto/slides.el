(TeX-add-style-hook "slides"
 (lambda ()
    (LaTeX-add-labels
     "eq:kd"
     "eq:K")
    (TeX-run-style-hooks
     "../header")))

