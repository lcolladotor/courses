R.exe -e "Sweave('%1.Rnw')"
R.exe -e "Stangle('%1.Rnw')"
pdflatex.exe %1.tex
