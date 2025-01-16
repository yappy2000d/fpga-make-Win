# Building FPGAs with make tool
Use the make tool to automate your work in CLI.

## Environments
- GNU Make 4.4.1(Built for Windows32)
- Intel Quartus II Web Edition(v13.0sp1 for Windows)
- ModelSim-Intel(Starter Edition)

## Usages
1. Modify project name in [config file](/config#L2). (must be same as the Top-Level Entity)
2. Before running the synthesis, change Devices in [syn/Makefile](/syn/Makefile#L41) file.
3. Before running the post-simulation, update the variable named REGION in the [sim/Makefile](/sim/Makefile#L7) file.

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
Gate Level Simulation. Please run synthesis first.
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
