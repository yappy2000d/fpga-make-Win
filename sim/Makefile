###################################################################
# Project Configuration
###################################################################
PROJECT = <project name>      # Same as Top-Level Entity
REGION = <region name>        # Instance name

WORK_DIR = work
SYN_DIR = ..\syn\simulation\modelsim
LIB_DIR = C:\altera\13.0sp1\modelsim_ase\altera\verilog\cycloneii

###################################################################
# Main Targets
###################################################################

all: check_work copy_src compile_sim

compile_sim:
	vlog $(wildcard *.v *.sv) -R -c -do "run -all; quit"
compile:
	vlog $(wildcard *.v *.sv) +define+macro=value

gate_level: check_work copy_src $(PROJECT)_v.sdo $(PROJECT).vo
	vlog $(wildcard *.v *.sv *.vo) -R -L $(LIB_DIR) -c \
	 -sdftyp $(REGION)=$(PROJECT)_v.sdo -do "run -all; quit"

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
