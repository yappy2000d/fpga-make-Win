###################################################################
# Project Configuration
###################################################################

include ../config

REGION = <region name>        # Instance name

WORK_DIR = work
SYN_DIR = ..\syn\simulation\modelsim
LIB_DIR = C:\altera\13.0sp1\modelsim_ase\altera\verilog\cycloneii

###################################################################
# Main Targets
###################################################################

compile: check_work copy_src 
	vlog $(wildcard *.v *.sv) +define+macro=value

pre-sim: check_work copy_src 
	vlog $(wildcard *.v *.sv) -R +notimingchecks -c -do "run -all; quit"

post-sim: check_work copy_src $(PROJECT)_v.sdo $(PROJECT).vo
	vlog $(wildcard *.v *.sv *.vo) -R -L $(LIB_DIR) -c \
	 -sdftyp $(REGION)=$(PROJECT)_v.sdo -do "run -all; quit"

clean:
	@del /q /f *.csd
	@rmdir /s /q $(WORK_DIR)

copy_src:
	@copy /y ..\src\* . >NUL
  
###################################################################
# Target implementations
###################################################################

.PHONY: check_work
check_work:
	@if not exist "$(WORK_DIR)" ( \
		vlib $(WORK_DIR) \
	)

$(PROJECT)_v.sdo: $(SYN_DIR)\$(PROJECT)_v.sdo
	@copy /y $< $@

$(PROJECT).vo: $(SYN_DIR)\$(PROJECT).vo
	@copy /y $< $@
