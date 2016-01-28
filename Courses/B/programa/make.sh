mkdir plots
R CMD Sweave $1.Rnw
pdflatex $1.tex
R CMD Stangle $1.Rnw
acroread $1.pdf &
