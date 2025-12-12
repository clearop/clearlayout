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
rm *.dpth
rm *.log
rm *.md5

echo "Processing PDFs..."
convertPDFfiles # Call function defined above

# done with layout.tex, return
cd $p


#Process layout_unbroken.tex ...
pdflatex -shell-escape layout_unbroken.tex
echo "" #Blank line

cd outputLayout_unbroken
rm *.dpth
rm *.log
rm *.md5

echo "Processing PDFs..."
convertPDFfiles # Call function defined above

# done with layout_unbroken.tex, return
cd $p

#
echo "DONE"
