# Nano Processor

*The assigned laboratory task encompasses creating a 4-bit nano processor capable of executing 
a basic set of instructions. This involves developing various components such as an Add/Subtract 
unit, a Program Counter, multiplexers, a Register Bank, an Instruction Decoder, and a Program 
ROM. The goal is to implement the provided instruction set and construct a functional 
nanoprocessor circuit.*

___

![image](https://github.com/PathumiRanasinghe/NanoProcessorDesignProject/assets/162596287/7781bbb1-a428-4d5d-91b6-12678bd09839)

___

## Content

* Assembly & Machine Code

* VHDL Codes
  * Instruction Decoder
  * 4-bit Add/Subtract unit
    * Half Adder
    * Full Adder
  * 3-bit adder
  * 3-bit Program Counter (PC)
    * D flip flop
  * 2-way 3-bit multiplexer
  * 2-way 4-bit multiplexer
    * 2-to-4 decoder
    * 3-to-8 decoder
  * 8-way 4-bit multiplexer
    * 8-way 1-bit multiplexer
  * Register Bank
    * Register
  * Program ROM
  * 7 segment display
    * LUT
  * Slow Clock
  * Top-level design

* Simulation files
  * Instruction Decoder
  * 4-bit Add/Subtract unit
  * 3-bit adder
  * 3-bit Program Counter (PC)
  * 2-way 3-bit multiplexer
  * 2-way 4-bit multiplexer
  * 8-way 4-bit multiplexer
  * Register Bank
  * Program ROM
  * 7 segment display
  * Slow Clock
  * Top-level design

* Constraints file

___

## Instructions

|   Instruction      |                   Description                                  | Machine code representationContributions|
|--------------------|----------------------------------------------------------------|-----------------------------------------|
|MOVI  R2,2          |Move immediate value 2 to register R2	                          | 100010000010                            |
|MOVI  R3,3          |	Move immediate value 3 to register R3	                        | 100100000011                            |
|MOVI  R7,1          |	Move immediate value 1 to register R7                         | 101110000001                            |
|ADD  R7,R1	         |Add values in registers R7 and R1 and store the result in R7	  | 001110010000                            |
|ADD  R7,R2	         |Add values in registers R7 and R2 and store the result in R7    | 001110100000                            |
|JZR  R0,5	         |Jump to line 5 if value in register R0 is 0 	                  | 110000000101                            |

___

## High level view

![Screenshot (283)](https://github.com/PathumiRanasinghe/NanoProcessorDesignProject/assets/162596287/0b44b812-68d8-475e-b9a3-c39213b759ad)

___

## Top-level design

![image](https://github.com/PathumiRanasinghe/NanoProcessorDesignProject/assets/162596287/b653e276-b35d-484f-a59d-f484e604ed27)

___

## Contributors

- [MethmiRathnayaka](https://github.com/MethmiRathnayaka)
- [Sanujiji](https://github.com/Sanujiji)
- [sathsaranii](https://github.com/sathsaranii)



