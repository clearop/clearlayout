#!/usr/bin/env bash

#Script to generate "fragments" output files
# for inclusion into other documents
# K. Sjobak, 2025

#Useful function
convertPDFfiles () {
    for f in `ls *.pdf`
    do
	echo "Processing '$f'..."
	
	#Using ImageMagic for converting from PDF
	# For older versions of ImageMagic, the command is "convert" not "magick"
	# Also note trick with ${f%.*} to remove .pdf from output file name
	magick -density 300 -quality 100 $f ${f%.*}.png
	
	#Using Cairo to convert to SVG
	pdftocairo -svg $f
    done
}

#Where to return to
p=`pwd`

#Process layout.tex ...
pdflatex -shell-escape layout.tex
echo "" #Blank line

cd outputLayout

echo "Organizing files..."
mv layout-figure0.pdf machine.pdf
mv layout-figure1.pdf BL2.pdf
mv layout-figure2.pdf experiments.pdf
mv layout-figure3.pdf legend.pdf

rm layout-figure*.dpth
rm layout-figure*.log
rm layout-figure*.md5

echo "Processing PDFs..."
convertPDFfiles # Call function defined above

# done with layout.tex, return
cd $p

#Process layout_unbroken.tex ...
pdflatex -shell-escape layout_unbroken.tex
echo "" #Blank line

#TODO: Fix layout_unbroken.tex...
