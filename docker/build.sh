#!/usr/bin/env bash
set -e

# Собираем Full Stack Developer
pdflatex -interaction=nonstopmode "CV_Evgeny Baulin_Full_Stack_Developer.tex"
pdflatex -interaction=nonstopmode "CV_Evgeny Baulin_Full_Stack_Developer.tex"

# Собираем Programmer Analyst
pdflatex -interaction=nonstopmode "CV_Evgeny_Baulin_Programmer_Analyst.tex"
pdflatex -interaction=nonstopmode "CV_Evgeny_Baulin_Programmer_Analyst.tex"

# Переименовываем PDF согласно требованию
mv "CV_Evgeny Baulin_Full_Stack_Developer.pdf" "CV. Evgeny Baulin. Full Stack developer.pdf"
mv "CV_Evgeny_Baulin_Programmer_Analyst.pdf" "CV. Evgeny Baulin. Programmer Analyst.pdf"

echo "Сборка завершена. Итоговые файлы:"
echo "  - CV. Evgeny Baulin. Full Stack developer.pdf"
echo "  - CV. Evgeny Baulin. Programmer Analyst.pdf"
