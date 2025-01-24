from PyPDF2 import PdfReader, PdfWriter


def split_pdf(input_pdf, output_pdf_1, output_pdf_2):
    reader = PdfReader(input_pdf)
    total_pages = len(reader.pages)
    mid_point = total_pages // 2

    # Первое половина
    writer1 = PdfWriter()
    for page in reader.pages[:mid_point]:
        writer1.add_page(page)
    with open(output_pdf_1, "wb") as out1:
        writer1.write(out1)

    # Вторая половина
    writer2 = PdfWriter()
    for page in reader.pages[mid_point:]:
        writer2.add_page(page)
    with open(output_pdf_2, "wb") as out2:
        writer2.write(out2)


# Параметры
split_pdf(
    "main.pdf",
    "CV. Evgeny Baulin. Backend Developer.pdf",
    "CV. Evgeny Baulin. Programmer Analyst.pdf"
)
