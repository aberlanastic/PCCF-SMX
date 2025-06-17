#!/usr/bin/make -f

#TEMPLATE_TEX_PD="rsrc/templates/pd-nologo-tpl.latex"
# Colors
BLUE= \e[1;34m
LIGHTBLUE= \e[94m
LIGHTGREEN= \e[92m
LIGHTYELLOW= \e[93m

RESET= \e[0m

# Templates 
TEMPLATE_TEX_PD="../rsrc/templates/eisvogel.latex"
PANDOC_OPTIONS="-V fontsize=12pt -V mainfont="../rsrc/sorts-mill-goudy/OFLGoudyStM.otf" --pdf-engine=xelatex "
TEMPLATE_TEX_TASK="../rsrc/templates/eisvogel.latex"

# PDFS
PDF_PATH:=$(shell readlink -f PDFS)



# RULES

clean:
	@echo " [${BLUE} * Step : Clean ${RESET}] "
	@echo "${LIGHTBLUE} -- PDFS ${RESET}"
	rm -f PDFS/*.pdf
	rm -f PDFS/*.odt


files:
	@echo " [${BLUE} * Step : Files ${RESET}] "
	@echo "${LIGHTBLUE} * Creating folder [ PDFS ]${RESET}"
	mkdir -p PDFS

proyecto: files
	@echo " [ Step : Proyecto Curricular SMX ]"
	@echo " * [ PDF ] : ..."

	@cd src/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_SMX.pdf ./PCCF_*.md

	#@echo " * [ ODT ] : Programacion Didactica ..."
	#@cd ProgramacionDidactica/ && pandoc -o $(PDF_PATH)/ProgramacionDidactica_SOM.odt ./PD_*.md 

	#@echo " * [ PDF Result ] : $(PDF_PATH)/ProgramacionDidactica_SOM.pdf"
	xdg-open $(PDF_PATH)/PCCF_SENIA_SMX.pdf

