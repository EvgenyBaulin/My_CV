#!/usr/bin/env bash
set -euo pipefail

echo "build.sh: старт"
mkdir -p output

# Компилируем каждый .tex два раза
for name in \
  CV_Evgeny_Baulin_Full_Stack_Developer \
  CV_Evgeny_Baulin_Programmer_Analyst \
  CV_Evgeny_Baulin_Eng \
  CV_Evgeny_Baulin_Rus
do
  pdflatex -interaction=nonstopmode -output-directory=output "$name.tex"
  pdflatex -interaction=nonstopmode -output-directory=output "$name.tex"
done

echo "build.sh: готово (PDF в ./output)"
