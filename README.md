Layout of CLEAR beamlines 
===
> Original code and layout: K. Sjobak, 2018
> Minor modifications: D. Gamba, 2020

## Content

- layout.tex: main Tex file for figure compilation
- inputLayout: folder with `tikzpicture` figures and macros to generate layouts
- outputLayout: folder with compiled version of layout figures  


## Figure/layout generation

Generation of the output files should be possible simply by: 
```
pdflatex -shell-escape layout.tex
```
which will populate the `outputLayout` folder with `.pdf` files of each single layout part (+many other intermediate/log files). The generated `layout.pdf` fileis normnally not of interesting use.
