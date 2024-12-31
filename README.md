# Sudoku Example Using SystemVerilog Constraints

Welcome to the **Sudoku Solver Example** implemented in SystemVerilog! This project demonstrates how to leverage SystemVerilog constraints to generate valid Sudoku puzzles and verify solutions.

## Run on [EDA Playground](https://www.edaplayground.com/x/h6vS)
 

## Project Overview

This project showcases:
- The use of SystemVerilog's randomization capabilities to generate Sudoku grids.
- Applying constraints to ensure valid Sudoku rules (rows, columns, and sub-grids contain unique numbers).
- A testbench to verify the correctness of the generated Sudoku grids.

The example serves as a learning resource for those interested in advanced SystemVerilog features, particularly for applications involving constrained randomization.

---

## Features

- **Randomized Sudoku Generator**: Generates valid Sudoku puzzles by applying constraints.
- **Constraint Logic**:
  - Each row contains unique digits (1–9).
  - Each column contains unique digits (1–9).
  - Each 3x3 sub-grid contains unique digits (1–9).
- **Verification Environment**:
  - Ensures generated grids comply with Sudoku rules.
  - Validates solutions for correctness.

---

