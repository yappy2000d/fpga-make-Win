WORK_DIR = work

###################################################################
# Main Targets
###################################################################
all: check_work copy_src compile_sim

compile_sim:
	vlog *.v -R -c -do "run -all; quit"
compile:
	vlog *.v
#vlog *.v *.sv +define+macro=value
  
###################################################################
# Target implementations
###################################################################
.PHONY: check_work
check_work:
	@if not exist "$(WORK_DIR)" ( \
		vlib $(WORK_DIR) \
	)

copy_src:
	@copy /y ..\src\* . >NUL
