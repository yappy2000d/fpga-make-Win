# Building FPGAs with make tool
Use the make tool to automate your work in CLI.

## Environments
- GNU Make 4.4.1(Built for Windows32)
- Intel Quartus II Web Edition(v13.0sp1 for Windows)
- ModelSim-Intel(Starter Edition)

## Usage
1. Modify project name in [config file](/config#L2). (must be same as the Top-Level Entity)
2. Before running the post-simulation, update the variable named [REGION](/sim/Makefile#L7) in the sim/Makefile file.

### Synthesis
> [!IMPORTANT]  
> Project name must be same as the Top-Level Entity.
```ps1
PS \path\to\project> cd syn; make all
```

### Pre-Sim
RTL Functional Simulation.
```ps1
PS \path\to\project> cd sim; make pre-sim
```

### Post-Sim
Gate Level Simulation.
> [!IMPORTANT]  
> REGION must be same as the instance name in testbench.
```ps1
PS \path\to\project> cd sim; make post-sim
```

### Full workflow
pre-sim -> synthesis -> post-sim
```ps1
PS \path\to\project> make all
```
