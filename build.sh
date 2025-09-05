#!/usr/bin/env bash
set -e

echo "Скрипт build.sh начал выполнение"
pwd
ls

# Создаём папку для выходных файлов
mkdir -p output
echo "Папка output создана"

# Собираем Full Stack Developer
pdflatex -interaction=nonstopmode -output-directory=output "CV_Evgeny_Baulin_Full_Stack_Developer.tex"
pdflatex -interaction=nonstopmode -output-directory=output "CV_Evgeny_Baulin_Full_Stack_Developer.tex"

# Собираем Programmer Analyst
pdflatex -interaction=nonstopmode -output-directory=output "CV_Evgeny_Baulin_Programmer_Analyst.tex"
pdflatex -interaction=nonstopmode -output-directory=output "CV_Evgeny_Baulin_Programmer_Analyst.tex"

# Собираем Programmer Analyst
pdflatex -interaction=nonstopmode -output-directory=output "CV_Evgeny_Baulin_Eng.tex"
pdflatex -interaction=nonstopmode -output-directory=output "CV_Evgeny_Baulin_Eng.tex"

# Собираем Programmer Analyst
pdflatex -interaction=nonstopmode -output-directory=output "CV_Evgeny_Baulin_Rus.tex"
pdflatex -interaction=nonstopmode -output-directory=output "CV_Evgeny_Baulin_Rus.tex"

# Переименовываем PDF согласно требованию
mv "output/CV_Evgeny_Baulin_Full_Stack_Developer.pdf" "CV. Evgeny Baulin. Full Stack Developer.pdf"
mv "output/CV_Evgeny_Baulin_Programmer_Analyst.pdf" "CV. Evgeny Baulin. Programmer Analyst.pdf"
mv "output/CV_Evgeny_Baulin_Eng.pdf" "CV Evgeny Baulin.pdf"
mv "output/CV_Evgeny_Baulin_Rus.pdf" "Резюме Евгений Баулин.pdf"

rm -rf output

echo "Сборка завершена"