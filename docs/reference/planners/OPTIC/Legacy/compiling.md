# Compiling Legacy OPTIC
## Using CMake on Linux for OPTIC-CLP
### Requirements
- Linux (Tested on Lubuntu 16.04 with GCC version 7.3.0 and 18.10
    - Note: Some GCC versions add and remove compilation features which cause OPTIC not to compile, try to use 7.3.0 if your compiler does not work
- OPTIC source code (from https://nms.kcl.ac.uk/planning/software/optic.html)
- Flex and Bison installed (use apt)
- Coinor CLP and CBC installed
### Steps
1. Extract the OPTIC source code to a directory of your choice

2. Modify the following files in optic/src/optic/
`FFEvent.cpp`
Add the line `#include <unistd.h>`
`FFSolver.cpp`
Add the line `#include <unistd.h>`
`opticMain.cpp`
Add the line `#include <unistd.h>`
3. Create a file `optic/src/build` and change directory `cd` into it 
4. Run the command cmake .. to create the necessary cmake files
5. If you encounter any errors based on dependencies, fix them now, these may include
    - G++, the C++ compiler
    - GSL, the Scientific Library
    - Zlib
6. Run the command `make optic-clp`
7. Congratulations! Your compiled OPTIC binary should be optic/src/build/optic/optic-clp
