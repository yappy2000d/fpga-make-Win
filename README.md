# Building FPGAs with make tool

Use the make tool to automate your work in CLI.

**Compatible with Verilog (including SystemVerilog) and Windows only.**

## Environments

- GNU Make 4.4.1(Built for Windows32)
- Intel Quartus II Web Edition(v13.0sp1 for Windows)
- ModelSim-Intel(Starter Edition)

## Usages

1. Add `C:\altera\13.0sp1\modelsim_ase\win32aloem` and `C:\altera\13.0sp1\modelsim_ase\win32aloem` to PATH.
2. Modify project name in [config file](/config#L2). (must be same as the Top-Level Entity)
3. Before running the synthesis, change Devices in [syn/Makefile](/syn/Makefile#L41) file.
4. Before running the post-simulation, update the variable named REGION in the [sim/Makefile](/sim/Makefile#L7) file.

### Synthesis

Generate a .vo netlist and a standard delay format output (.sdo) file.

> [!IMPORTANT]  
> [Project name](/config#L2) must be same as the Top-Level Entity.

> [!TIP]
> Change Devices in [syn/Makefile](/syn/Makefile#L41) file.

```ps1
PS \path\to\project> cd syn; make all
```

### Pre-Sim

RTL Functional Simulation.

```ps1
PS \path\to\project> cd sim; make pre-sim
```

### Post-Sim

Run Gate-Level Simulation using .vo and .sdo files generated from synthesis.

> [!IMPORTANT]  
> Must run synthesis first. [REGION](/sim/Makefile#L7) must be same as the instance name in testbench.

```ps1
PS \path\to\project> cd sim; make post-sim
```

### Full workflow

pre-sim -> synthesis -> post-sim

```ps1
PS \path\to\project> make all
```

## Directory Structure

An example. Read more at https://blog.yappy2000.com/technology/fpga-make-win/

    MyProject
    │  config
    │  Makefile
    │  README
    ├─sim
    │      booth_tb.v
    │      Makefile
    ├─src
    │      booth.v
    └─syn
           Makefile
