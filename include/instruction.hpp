#ifndef _INTEL_8080_INSTRUCTION_CLASS_HPP_
#define _INTEL_8080_INSTRUCTION_CLASS_HPP_

#include <array>
#include <cstdint>
#include <string>

class Instruction
{
  std::uint8_t _opcode;
  std::uint8_t _numOperands;
  std::array<std::uint8_t, 2> _operands;
  std::string _mnemonic;
  std::uint8_t _numClkCycles;

public:
  Instruction (std::uint8_t opcode, std::uint8_t numOperands,
               std::array<std::uint8_t, 2> operands, std::string mnemonic,
               std::uint8_t numClkCycles);
};

#endif /* _INTEL_8080_INSTRUCTION_CLASS_HPP_ */
