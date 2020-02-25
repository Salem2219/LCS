# The Longest-Common-Subsequence Problem
Basic Finite State Machine with Datapath (FSMD) to compute the length c[i][j] of a longest common subsquence of
a[1],...,a[i] and b[1],...,b[j] for i= 0,...,m(3 bits) and j=0,...n(3 bits).

## Notes :
- The a,b arrays are rom/ram 7 x 1 letter, which every letter has a unique binary number (5 bits).
- The a,b array indices should start from 0 to 7, but the program works on indices from 1 to 7.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem2219/LCS.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd LCS
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, n = 7, m = 7. Note : the a,b arrays contents are specified in a_rom.vhd and b_rom.vhd respictively:

    ```sh
    $ vsim work.tb
    ```
6. Add the following commands to the transcript
```sh
    $ add wave -position end  sim:/tb/dut/u4/program
    $ run 30ns
    ```
