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

# Переименовываем PDF согласно требованию
mv "output/CV_Evgeny_Baulin_Full_Stack_Developer.pdf" "output/CV. Evgeny Baulin. Full Stack Developer.pdf"
mv "output/CV_Evgeny_Baulin_Programmer_Analyst.pdf" "output/CV. Evgeny Baulin. Programmer Analyst.pdf"

rm output/*.aux output/*.log output/*.out

echo "Сборка завершена. Итоговые файлы:"
ls output
