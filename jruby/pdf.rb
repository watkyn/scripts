require 'java'

module PDF
  include_package "com.itextpdf.text"
end

pdf = PDF::Document.new
paragraph = PDF::Paragraph.new "Brought to you by JRuby"
file = java.io.FileOutputStream.new 'pdf_demo.pdf'

com.itextpdf.text.pdf.PdfWriter.get_instance pdf, file
pdf.open
pdf.add paragraph
pdf.close

