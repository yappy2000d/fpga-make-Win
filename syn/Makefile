###################################################################
# Project Configuration:
#
# Specify the name of the design (project), the Quartus II Settings
# File (.qsf), and the list of source files used.
###################################################################

include ../config

ASSIGNMENT_FILES = $(PROJECT).qpf $(PROJECT).qsf

###################################################################
# Main Targets
#
# all: build everything
# clean: remove output files and database
###################################################################

all: copy_src smart.log $(PROJECT).asm.rpt $(PROJECT).sta.rpt eda

clean:
	@del /q *.rpt *.chg smart.log *.htm *.eqn *.pin *.sof *.pof
	@rd /q /s .\db .\incremental_db

map: smart.log $(PROJECT).map.rpt
fit: smart.log $(PROJECT).fit.rpt
asm: smart.log $(PROJECT).asm.rpt
sta: smart.log $(PROJECT).sta.rpt
eda: smart.log $(PROJECT).asm.rpt $(PROJECT).sta.rpt
	quartus_eda $(PROJECT) --simulation --tool=modelsim --format=verilog
smart: smart.log

copy_src:
	@copy /y ..\src\* . >NUL
	$(eval SOURCE_FILES := $(wildcard *.v))

###################################################################
# Executable Configuration
###################################################################

MAP_ARGS = --family="Cyclone II"
FIT_ARGS = --part=EP2C70F896C8
ASM_ARGS =
STA_ARGS =

###################################################################
# Target implementations
###################################################################

STAMP = echo done >

$(PROJECT).map.rpt: map.chg $(SOURCE_FILES)
	quartus_map $(MAP_ARGS) $(PROJECT)
	$(STAMP) fit.chg

$(PROJECT).fit.rpt: fit.chg $(PROJECT).map.rpt
	quartus_fit $(FIT_ARGS) $(PROJECT)
	$(STAMP) asm.chg
	$(STAMP) sta.chg

$(PROJECT).asm.rpt: asm.chg $(PROJECT).fit.rpt
	quartus_asm $(ASM_ARGS) $(PROJECT)

$(PROJECT).sta.rpt: sta.chg $(PROJECT).fit.rpt
	quartus_sta $(STA_ARGS) $(PROJECT)

smart.log: $(ASSIGNMENT_FILES)
	quartus_sh --determine_smart_action $(PROJECT) > smart.log

###################################################################
# Project initialization
###################################################################

$(ASSIGNMENT_FILES):
	quartus_sh --prepare $(PROJECT)

map.chg:
	$(STAMP) map.chg
fit.chg:
	$(STAMP) fit.chg
sta.chg:
	$(STAMP) sta.chg
asm.chg:
	$(STAMP) asm.chg

