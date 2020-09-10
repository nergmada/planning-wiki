# Compiling OPTIC+
## Using CLion on Linux (Easy)
The easiest way to get OPTIC+ running with minimal effort is using JetBrain’s CLion IDE. It comes with Cmake and other key toolchains out of the box. This method is not suitable for people who do not have access to CLion, or cannot get access because they cannot install it on the machine they’re using.
### Requirements:
- Linux (Tested on Ubuntu 16.04 with G++ version 5.4.0)
- CLion installed (Note, you can get this on an academic Licence with the GitHub student pack)
- Access to the OPTIC+ git repository (not publicly available)
    - This repository may also be labelled as “rewrite”
- Flex installed, use your OS’s package manager to install flex if it is not installed
- Bison installed, same as above
- CPLEX installed (if you wish to compile the CPLEX version)
### Steps

1. Clone the OPTIC+ repo to a folder of your choice, I personally use “~/development” and create a “development” folder in my home directory

> Note: that the git repo used in this guide is private, and therefore this repo may be different to yours. If unsure, follow the instructions on GitHub on how to clone the repo you have access to.

2. With the OPTIC+ repo cloned, change directory into the repo, the folder will be the same as the name of the repo, in my case the name of the repo is “rewrite”

3. We need to check now if VALFiles was included with your repo, or if it needs to be cloned separately. If your repo contains a folder called “VALfiles” then you’re in business and you can skip this step,
 
    If not you’ll need to clone VALfiles into your OPTIC folder using the same command we used above. If you’ve been supplied a repo without VALFiles included and have not been given a link to a separate repo with VALFiles in, you should go back to the person who provided you with the repo

4. Now one way or another, we definitely have VALfiles along with our OPTIC+ code, open CLion and use the “Open Project” option to open the folder containing OPTIC+

5. With your CLion Project open, CMake should automatically run each time the CMakeLists.txt is changed, you can check that your CMake has succeeded at the bottom of the editor where it says CMake.

6. We now need to use different steps to compile different versions of OPTIC+, please select from the steps below in order to compile either no LP version, or the CPLEX version (CLP coming soon)

#### Compiling with no Linear Programming (no LP - Easy)
Good choice, CLion should pretty much do this straight out the box, in order now to bring it home, we do the following

7. In the top right corner of the editor, you need to select “rewrite-no-lp” this may be named “optic+-no-lp” or some variant with the words “-no-lp” appended to the end

8. Now use the hammer icon to build the executable. A command line will appear at the bottom and show the progress of the build. Once finished the build will most likely end up a folder called “cmake-build-debug” or something similar, you’ll be able to identify it from the red folder icon

> Note: You may wish to build it for release instead of debug, this will most likely be no different in terms of the OPTIC code itself, but may be slightly more efficient in the build process

9. You can now run OPTIC+ inside CLion by using the play symbol to the right of the previous drop down menu, or you can use a terminal to run it from the command line. Your finished binary is available in the "cmake-build-debug" folder.

#### Compiling with CPLEX (hard)
Compiling with CPLEX is harder, and requires a lot of tweaking to get it working. Also some of these instructions may be obsolete for the version of OPTIC+ you’re using as there are plans to patch the CMake file to test CPLEX newer versions of correctly.

Currently the main hurdle for getting CPLEX OPTIC+ to compile is getting it to recognise that CPLEX is in fact available. CMake uses a file called “findCPLEX” in order to find CPLEX this is located in “./cmake/modules” within the OPTIC+ directory

7. We need to add new variables to the “CMakeLists” file which point to where CPLEX is located, these are as follows

```cmake
#path to CPLEX
set(CPLEX_DIR /opt/ibm/ILOG/CPLEX_Studio_Community128)
#The rest of the variables below should not need to be changed
set(ILOCPLEX ${CPLEX_DIR}/cplex/lib/x86-64_linux/static_pic/libilocplex.a)
set(CPLEX ${CPLEX_DIR}/cplex/lib/x86-64_linux/static_pic/libcplex.a)
set(CONCERT ${CPLEX_DIR}/concert/lib/x86-64_linux/static_pic/libconcert.a)
set(CP_OPTIMIZER ${CPLEX_DIR}/cpoptimizer/lib/x86-64_linux/static_pic/libcp.a)
set(CP_OPTIMIZER_INCLUDES ${CPLEX_DIR}/cpoptimizer/include)
set(CPLEX_INCLUDES ${CPLEX_DIR}/cplex/include)
set(CONCERT_INCLUDES ${CPLEX_DIR}/concert/include)
set(CPLEX_EXTRA_LIBRARIES "-lpthread -ldl")
```

You may not need to change any of the paths here, but if you installed CPLEX in a different location, you should change CPLEX_DIR. The rest are relative to where CPLEX is installed and all are necessary in order to run

8. Now, we still have two problems to fix, some of the code that OPTIC+ uses from the CPLEX library is Deprecated. So we need to turn off warning errors in order to stop the compiler from terminating when a deprecation warning comes up, I do this by commenting out the following block

```cmake
#if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
#ADD_DEFINITIONS(-Werror)
#endif()

#if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
#ADD_DEFINITIONS(-Werror)
#endif()
```

9. Secondly, the findCPLEX file is still going to tell the rest of CMake that OPTIC cannot be found, by setting the flag `CPLEX_COMPILES` to false. We’re going to override this and set it to true, make sure this is below the `find_package(CPLEX)` command otherwise it won’t work

```cmake
set(CPLEX_COMPILES TRUE)
```

10. We’ve made a lot of changes to our CMake files and in CLion it won’t automatically rerun CMake when we make changes, a yellow banner should appear asking if you want to reload, click the reload button on the yellow banner
Now go to the top right corner and select “rewrite-cplex” or the name with “-cplex” at the end and hit the hammer icon to the left

> Note: if the yellow reload banner doesn't appear go to Files > Reload CMake Project and this will achieve the same result

11. Now that OPTIC+ CPLEX version is built, you can either hit the play button in the editor or use the terminal to access the file it was built in to run it and enjoy the wonders of CPLEX OPTIC+ in your very own environment

> Note: The binary can be found in the "cmake-build-debug" folder

## Using a Command Line Compilation Approach on Linux (Thrilling)
It is perfectly possible to build OPTIC+ on the command line, and is more practical in environments where you don’t have the ability to install software (such as IDEs). This compilation guide will assume an understanding of basic shell commands in Linux (e.g. ls, cd, mkdir etc.). 

> Note: This approach is harder to test as it can only be tested in the environment used to test the tutorial. It's not possible to know what toolchains you're using. The path of least resistance when compiling will be to use the same versions listed here.

### Requirements
- Linux (tested on Ubuntu 18.04 - Bionic Beaver)
- G++ (tested on version 5.4.0)
- CMake (tested on version 3.5.1)
- Make (tested on version 4.1)
- Access to the OPTIC+ git repository (not publicly available)
    - This repository may also be labelled as “rewrite”
- Flex installed, use your OS’s package manager if flex is not already installed
- Bison installed, same as above.
- CPLEX installed (if you wish to compile the CPLEX version)

### Steps
1. Clone the OPTIC+ repo to a folder of your choice, I personally using “~/development” and create a “development” folder in my home directory

`cd ~/development`

`git clone https://www.github.com/yourOPTIC+Version.git`

> Note: that the git repo used here is private, and therefore this repo may be different to yours. If unsure, follow the instructions on GitHub on how to clone the repo you have access to.

2. With the OPTIC+ repo cloned, change directory into the repo, the folder will be the same as the name of the repo, in my case the name of the repo is “rewrite”

`cd rewrite`

3. We need to check now if VALfiles was included with your repo, or if it needs to be cloned separately. If your repo contains a folder called “VALfiles” then you’re in business and you can skip this step,
    
    `ls`

    ```
    adamgreen@nmscmo004431:~/development/rewrite$ ls
    Actions            DerivedPredicates        Schedulers
    Analysis           Doxyfile.in              Search
    boost              globals.cpp              sorted_vector.cpp
    boost158           globals.h                sorted_vector.h
    cmake              Happenings               State
    cmake-build-debug  Heuristic                Testing
    CMakeLists.txt     Initialisation           translate
    colours.h          main.cpp                 UseDoxygen.cmake
    Constraints        Primitives               VALfiles
    cputime.cpp        ProcessEventHandler.cpp  vecset.h
    cputime.h          ProcessEventHandler.h

    ```
   
    If not you’ll need to clone VALfiles into your OPTIC folder using the same command we used above

    `git clone https://www.github.com/yourVALfiles.git`

    If you’ve been supplied a repo without VALFiles included and have not been given a link to a separate repo with VALFiles in, you should go back to the person who provided you with the repo

4. Create a new directory in which to build in, I am going to use build (for obvious reasons), you can create a new directory 

    `mkdir build && cd build`

5. Inside the build folder run the following CMake command in order to generate the cmake for the OPTIC+ folder above

    `cmake ..`

6. Our CMake is generated, although we will most likely need to run this command again when we come to choose which version of OPTIC+ we wish to compile. Depending on which version of OPTIC+ you wish to compile (either CPLEX or no-lp, CLP coming soon) follow the steps below

#### Compiling with no Linear Programming (Easy)
7. Run the following command, which will tell cmake to build the optic+ no-lp version. 

`cmake --build . --target rewrite-no-lp`

> Note: that the target may not be “rewrite-no-lp” but instead something like `optic+-no-lp`. You can find the correct target name by looking inside “CMakeLists.txt”,  and look for the `ADD_EXECUTABLE` which contains the ending `-no-lp`

#### Compiling with CPLEX (Harder)

Compiling CPLEX requires us to tweak a bit of the CMakeLists file in order for it to accept CPLEX exists and compile it. The steps below outline how.

7. Open the OPTIC+ folder in the code editor of your choice, I strongly endorse [Visual Studio Code](https://code.visualstudio.com/) because it now has a [PDDL plugin](https://marketplace.visualstudio.com/items?itemName=jan-dolejsi.pddl) (useful for later). Find the CMakeLists.txt in your editor

    `code ..`

8. We firstly need to add the paths to CPLEX, which should already be installed (because you installed it before starting this guide). We can do it by setting the following variables like so:

    ```cmake
    #path to CPLEX
    set(CPLEX_DIR /opt/ibm/ILOG/CPLEX_Studio_Community128)
    #The rest of the variables below should not need to be changed
    set(ILOCPLEX ${CPLEX_DIR}/cplex/lib/x86-64_linux/static_pic/libilocplex.a)
    set(CPLEX ${CPLEX_DIR}/cplex/lib/x86-64_linux/static_pic/libcplex.a)
    set(CONCERT ${CPLEX_DIR}/concert/lib/x86-64_linux/static_pic/libconcert.a)
    set(CP_OPTIMIZER ${CPLEX_DIR}/cpoptimizer/lib/x86-64_linux/static_pic/libcp.a)
    set(CP_OPTIMIZER_INCLUDES ${CPLEX_DIR}/cpoptimizer/include)
    set(CPLEX_INCLUDES ${CPLEX_DIR}/cplex/include)
    set(CONCERT_INCLUDES ${CPLEX_DIR}/concert/include)
    set(CPLEX_EXTRA_LIBRARIES "-lpthread -ldl")
    ```

> Note that you do not need to change anything other than “CPLEX_DIR” to the path where you installed CPLEX (and in many cases that path will still be the same). The rest you should copy verbatim

9. Next we need to comment out the error on warning section of the CMake file because the CPLEX part of OPTIC is using some deprecated code which will compile, but compiles with warnings

    ```cmake
    #if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    #ADD_DEFINITIONS(-Werror)
    #endif()

    #if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    #ADD_DEFINITIONS(-Werror)
    #endif()
    ```

10. Now we need to tell CMake that CPLEX is in fact available and can compile by overriding the “CPLEX_COMPILES” flag in the CMakeLists.txt file. We can do that like so

    ```cmake
    set(CPLEX_COMPILES TRUE)
    ```

> Note that the set command should be below the “find_package(CPLEX)” command otherwise it’ll be overwritten with “FALSE”

11. Okay, we’re now good to go, lets go back to the terminal and enter the following commands inside our build folder

`cmake --build . --target rewrite-cplex`

> Note that the target may not be called “rewrite-cplex”, you’ll need to work out the target name based on the name given to the executable in the “ADD_EXECUTABLE” method within the CMakeLists.txt file. They name should end in “-cplex”

12. Okay, a newly generated executable ending in CPLEX should now be inside your build folder ready for you to enjoy the wonders of CPLEX driven OPTIC+.

> Note: The binary can be found in the "cmake-build-debug" folder

## Compiling On Windows using Docker (Easy)
So you want to compile and run on Windows, good choice. I personally prefer Windows for the majority of my computing activities, but unfortunately for AI planning it’s a tough environment to work in. The easiest solution, assuming you have User Access rights to install programs, is to use a containerised version of Ubuntu Linux.

I’ve created a dockerfile pre-configured to copy and run OPTIC+ in, which you can use to contain your OPTIC+ execution. Unfortunately this isn’t ideal for development of OPTIC+ and to be honest if you want to do that, you should be doing it natively on Linux, or worst case scenario, in a VBox.

### Requirements

- Docker for Windows (just google it there’ll be a download)
- Git for Windows (same as above)
- A decent CLI (cmd.exe is fine, but I prefer git bash, I would use git bash which will come in the Git for Windows install you have)
- Access to the OPTIC+ git repository (or some other copy of the source)
- A sense of adventure

###  Steps

1. Assuming you have met all the requirements above, the first step is to get the OPTIC+ source code. Open git bash and navigate to where you wish to clone to and then clone in my case as shown below. Note OPTIC+ is currently named “rewrite” and so you may find that the names in this guide are different to your names, do not be alarmed, they’re almost certainly interchangeable... probably... hopefully.

    `cd ~/development`

    `git clone https://www.github.com/yourOPTIC+Version.git`

    > Note: Yes you can use bash commands on Git Bash, mostly

2. Make sure your copy of OPTIC+ contains “VALfiles”. This is important, as VAL is a dependency of OPTIC+. My copy does not and therefore I have to clone VALfiles into OPTIC+ separately as shown below

    `cd rewrite`

    `git clone https://www.github.com/yourVALfilesVersion.git`
    
    > Note: The OPTIC+ file used in this example is called `rewrite`

3. The next step involves cloning in my docker file, which can be found at [here](https://raw.githubusercontent.com/nergmada/optic-docker/master/dockerfile) which I’m going to retrieve by curling but you can just download into your copy of OPTIC+ if you don’t want to follow my commands

    `curl https://raw.githubusercontent.com/nergmada/optic-docker/master/dockerfile > dockerfile`

Our folders should now look like this 

    `ls`

    ```
    adamgreen@nmscmo004431:~/development/rewrite$ ls
    Actions            DerivedPredicates        Schedulers
    Analysis           Doxyfile.in              Search
    boost              globals.cpp              sorted_vector.cpp
    boost158           globals.h                sorted_vector.h
    cmake              Happenings               State
    cmake-build-debug  Heuristic                Testing
    CMakeLists.txt     Initialisation           translate
    colours.h          main.cpp                 UseDoxygen.cmake
    Constraints        Primitives               VALfiles
    cputime.cpp        ProcessEventHandler.cpp  vecset.h
    cputime.h          ProcessEventHandler.h

    ```

4. We’re now ready to create a docker image, run the following command. We’re going to name our new docker image optic, but if you like you can change this. We will need it later though so make it obvious and easy to remember

    `docker image build -t optic .`

> Docker will now build according to the dockerfile you downloaded from me, which will involve setting up an ubuntu environment, getting dependencies installed and compiling OPTIC+. Ready for us to fire up the container and run OPTIC+ within it.

5. Okay once our docker image is finished building, we can run the following command. You should modify this command to point to where you are keeping your pddl files, such as your domain and problem files. Replace `C:/path/to/problem/folder` with the appropriate path. 

    > note: relative paths will not work

`docker run -it -v C:/path/to/problem/folder optic bash`

    Docker will ask your permission to access this path and may require you to enter a password, the container won’t start until you’ve given it permission

6. And like magic, we have a virtual OPTIC+ environment on Windows, if we change directory into home we will find two folders, one with our compiled optic in and the other with our exposed Windows host folder which we can use to transfer domains between the container and the host. 

7. To run OPTIC we can do something like

    `cd /home/rewrite/build`

    `./rewrite-no-lp /home/dandp/domain.pddl /home/dandp/problem.pddl`
 
## Compiling On Windows Natively (Hard-ish)
For some, compiling OPTIC in docker is not for them, and that’s fine. In a containerised world where people want to put you in boxes, it is sometimes necessary to break out of them. Places where compiling OPTIC natively are important is if you’re crazy enough to try to modify the code on Windows, or you’re deploying OPTIC to a windows server. In both cases a better question than “how?” is “why?”, but nonetheless, I’ll answer how. 

### Requirements

- Chocolatey for Windows (Chocolatey is a package manager for windows, we’re going to use it to get bison and flex)
- Cygwin (Make sure when you install cygwin you include GCC compilers, CMake and Make)
- Python2.7 (This is literally the most annoying dependency, but it must be 2.7)
- Git for Windows (if your source is from github)
- Patience (Not software, but rather the quality often found in Jedi warriors, and other mythical humans)

### Steps
1. Let’s begin by installing two dependencies which I didn’t list in requirements. This is because when we get Bison and Flex we cannot simply download the GNU ones available on the web (these are out of date and very incompatible). We can get Bison and flex as one friendly package by running the following chocolatey command

    `choco install winflexbison3`

2. With Bison and Flex now courteously installed for us by Chocolatey with no errors, we can proceed to get our OPTIC+ source code. I’m going to get mine via git as shown below. Note that you will need to install git for windows to use git. You may have been provided OPTIC+ source as a zip folder though, in which case unpack this instead

    `git clone https://www.github.com/yourOPTIC+Version.git`

3. Make sure your OPTIC comes with VALfiles included, if not, you may also need to add them in. VALfiles should be in the directory where the rest of the OPTIC+ code is, but depending on how you’ve received your source code it may be packaged separately. Mine is so I’m going to clone that too, now

    `cd rewrite`

    `git clone https://www.github.com/youVALfilesVersion.git`

    > Note: my version of OPTIC+ is in a folder called `rewrite`

5. Okay, so we’re in our source code folder with a command line. In my case, I’m using Git Bash, but cmd (Windows standard command prompt) should work fine too. We now need to modify VALfiles slightly, because it’s designed to detect linux flex not windows flex. We’re going to locate using a text editor the following `<your-optic-directory>/VALfiles/parsing/CMakeLists.txt`
Where we see the line `FIND_PROGRAM(FLEX_EXECUTABLE flex)` and the lines `FIND_PROGRAM(BISON_EXECUTABLE bison)` we need to change the program name to `win_flex` and `win_bison` as shown

```cmake
FIND_PROGRAM(FLEX_EXECUTABLE win_flex)
FIND_PROGRAM(BISON_EXECUTABLE win_bison)
```

6. We also need to modify the main CMakeLists.txt file in the main OPTIC+ directory i.e. `<your-optic-directory>/CMakeLists.txt` This is so that we show the compiler where to find `FlexLexer.h` add the following line

    ```cmake
    set(FLEXLEXER_H_DIR "C:/ProgramData/chocolatey/winflexbison/tools")
    ```

    > Note: if you’ve decided to tell chocolatey to install programs somewhere else whilst setting chocolatey up or installing Winflexbison3 then this path may be different


7. Let us now make a build folder and change directory into it, then run cmake with a the “Unix Makefiles” generator as shown

    `mkdir build && cd build`

    `cmake -G "Unix Makefiles" ..`

> Note: CMake, g++ and gcc all need to be available on your path. If you don’t know how to add directories to your path, or why directories containing executables even need to be added to path, you may want to consider exploring how the Command line works more before proceeding with this guide

8. The previous command is going to tell you that a lot of stuff is missing like CLP, CBC COINUTILS etc. Don’t worry, that won’t affect us. We’re going to compile either a non-linear programming version of OPTIC or a CPLEX version of OPTIC. Please select which version you wish to compile and use the sections below to compile that version

#### Compiling With No Linear Programming (Pretty Straightforward now)

So getting a No-LP version of OPTIC spun up is pretty straightforward, We have to turn a few safeties off to make the compiler take more risks, but without risk there would be no reward right?

9. We need to disable “fail on all warnings” which is a directive given in the CMakeLists file for OPTIC+ as shown below. I prefer to comment it out than delete it, just because I feel like OPTIC+ is sacred and to delete anything would be sacrilege 

    ```cmake
    #if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    #ADD_DEFINITIONS(-Werror)
    #endif()

    #if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    #ADD_DEFINITIONS(-Werror)
    #endif()
    ```

10. We now need to add a missing include in `MutexGroups.h` file, which is located in the `primitives` folder. This is something that doesn’t seem to affect Linux compilations, but that doesn’t matter too much because it’s an easy fix

```C++
#include <iostream>
```

11. Okay, we’re now good to go, let’s fire up the CMake and get it building us some OPTIC+. Now it may decide to show some output you’ve already seen when running CMake initially, don’t sweat it, CMake is just being thorough. Run the command shown below

`cmake --build . --target rewrite-no-lp`

After a while of compilation (don’t worry it will take about 5 minutes) optic will be ready for you to play with simply by running the executable like so

`./rewrite-no-lp.exe`

#### Compiling with CPLEX
I’m sorry, I haven’t found a way to do this unfortunately. It seems that CPLEX has some dependencies that aren’t available on Windows, even if you use the windows compiled libraries. I’ve done research into what is missing, but most CPLEX forums just conclude “what you’re trying to do is not supported”
