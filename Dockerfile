FROM blang/latex:latest
LABEL authors="evgenybaulin"

COPY . /usr/src/app

WORKDIR /usr/src/app

CMD latexmk -pdf CV_Evgeny_Baulin_Full_Stack_Developer.tex && latexmk -pdf CV_Evgeny_Baulin_Programmer_Analyst.tex
