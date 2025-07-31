# Nano Processor Project

A comprehensive VHDL implementation of a 4-bit nano processor designed for educational purposes, featuring both base and modified versions with enhanced functionality.

## 🔧 Features

### Base Nano Processor
- **4-bit Architecture**: Simple yet functional processor design
- **Instruction Set**: Support for basic arithmetic and control operations
- **Register Bank**: 8 registers for data storage and manipulation
- **Program Counter**: 3-bit counter for instruction sequencing
- **ALU Operations**: Addition, subtraction, and comparison operations
- **Display Interface**: Seven-segment display driver for output visualization

### Modified Nano Processor
- **Enhanced Functionality**: Improved instruction set with additional operations
- **3-Way Multiplexer**: Extended data path capabilities
- **Optimized Design**: Performance improvements and bug fixes
- **Extended Testing**: Comprehensive testbench suite

## 📁 Project Structure

```
├── base nano processor/           # Original implementation
│   ├── project_3/                # Vivado project files
│   │   ├── project_3.srcs/       # Source files
│   │   │   ├── sources_1/new/    # VHDL component files
│   │   │   └── sim_1/new/        # Testbench files
│   │   └── Basys3Labs.xdc        # Constraint file for FPGA
│   └── base nano processor_BitStream.bit  # FPGA bitstream
│
├── modified nano processor/       # Enhanced implementation
│   ├── project_3/                # Vivado project files
│   │   ├── project_3.srcs/       # Source files
│   │   │   ├── sources_1/new/    # Enhanced VHDL components
│   │   │   └── sim_1/new/        # Updated testbenches
│   │   └── Basys3Labs.xdc        # Constraint file for FPGA
│   └── modified nano processor_BitStreams.bit  # Enhanced FPGA bitstream
│
├── Instructions.txt              # Project guidelines and specifications
├── Lab 9-10_Group 34.pdf        # Detailed project documentation
└── README.md                     # This file
```

## 🧩 Core Components

### Arithmetic and Logic Components
- **Full Adder & Half Adder**: Basic arithmetic building blocks
- **4-bit Adder/Subtractor**: Main ALU component
- **4-bit Comparator**: For conditional operations
- **4-bit Multiplier**: Enhanced arithmetic operations

### Data Path Components
- **Register Bank**: 8x4-bit register file
- **Multiplexers**: 2-way, 3-way, and 8-way data selection
- **Bus System**: Interconnection infrastructure

### Control Components
- **Instruction Decoder**: Instruction parsing and control signal generation
- **Program Counter**: Sequential and conditional program flow
- **Program ROM**: Instruction memory implementation

### I/O and Interface
- **Seven Segment Driver**: Display interface for output
- **Clock Management**: Slow clock generation for FPGA implementation

## 🚀 Getting Started

### Prerequisites
- **Xilinx Vivado**: Version 2019.1 or later
- **FPGA Board**: Basys3 or compatible Artix-7 based board
- **VHDL Knowledge**: Basic understanding of digital design

### Installation and Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Platinum-Saber/Nano-Processor-.git
   cd Nano-Processor-
   ```

2. **Open in Vivado**
   - Launch Xilinx Vivado
   - Open either `base nano processor/project_3/project_3.xpr` or `modified nano processor/project_3/project_3.xpr`

3. **Simulation**
   - Navigate to the simulation sources
   - Run the testbenches to verify functionality
   - Key testbenches: `nanoprocessor_tb.vhd`, `RegBank_tb.vhd`, `addsub4_tb.vhd`

4. **FPGA Implementation**
   - Synthesize the design
   - Implement and generate bitstream
   - Program your Basys3 board with the generated `.bit` file

## 🔬 Testing and Verification

The project includes comprehensive testbenches for all major components:

- **Component-Level Testing**: Individual module verification
- **Integration Testing**: Full processor functionality validation
- **Timing Analysis**: Clock domain and timing constraint verification

### Running Simulations

1. Select the desired testbench in Vivado
2. Click "Run Simulation" → "Run Behavioral Simulation"
3. Analyze waveforms and verify expected behavior

## 📊 Performance Specifications

- **Clock Frequency**: Optimized for educational FPGA boards
- **Data Width**: 4-bit processing
- **Instruction Memory**: 16 instructions maximum
- **Register Count**: 8 general-purpose registers
- **Instruction Types**: Arithmetic, logic, and control flow

## 🛠️ Development Timeline

This project represents the culmination of Computer Organization and Digital Design coursework, implementing fundamental processor concepts in VHDL.

## 📚 Documentation

- **Lab Instructions**: See `Instructions.txt` for detailed requirements
- **Project Report**: Comprehensive analysis in `Lab 9-10_Group 34.pdf`
- **Code Documentation**: Inline comments in all VHDL files

## 🤝 Contributing

This is an academic project. For educational purposes, feel free to:
- Study the implementation approaches
- Suggest improvements or optimizations
- Report any issues or bugs found

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🎓 Academic Context

**Course**: Computer Organization and Digital Design  
**Institution**: University of Moratuwa <br/>
**Semester**: SEM 1  
**Group**: Group 34

## 📞 Contact

**Author**: Sansika Suhan Waduge  
**GitHub**: [@Platinum-Saber](https://github.com/Platinum-Saber)

---

*This project demonstrates practical implementation of computer architecture concepts through VHDL design and FPGA prototyping.*
