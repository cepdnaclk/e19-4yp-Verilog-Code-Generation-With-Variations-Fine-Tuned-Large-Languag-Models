module latch (input d, c, packed {q_b,q} );

The only visible changes are that the output is now a packed union, and that the "q" signal is now declared packed.

### Verilog Simulation:
The simulation results look as expected:

![sim_packunion](screenshots/verilog/packunion.png "Simulation Results")

### Verilog Analysis:

The new packed {q_b,q} outputs are now defined with a new instance of the "packed" attribute:

![packed_def](screenshots/verilog/pack_def.png "Attribute Definition")

This defines the packed representation of the q_b and q signals. The attribute is defined once and only once for each signal.

The packed {q_b,q} outputs are now connected to the "pack" module:

![pack_inst](screenshots/verilog/pack_inst.png "Packed Signal")

The pack module just unpacks the q_b and q signals to form the packed representation.

The q and q_b signals now have a netlist definition:

![q_def](screenshots/verilog/q_def.png "q and q_b Signal")

The "assign" statement is no longer needed since the packed {q_b,q} outputs are now defined in the same module as the unpacking module.

The unpacking module "assign" statement has now been removed:

![q_inst](screenshots/verilog/q_inst.png "Assign Statements")

And the pack module has been removed:

![pack_rem](screenshots/verilog/pack_rem.png "pack Module")


### Final Verilog File:

The final verilog file is only a single module, and is as follows:

```

module latch (input d, c, packed {q_b,q} );

assign {q_b,q} = {d,d};

assign q = d & c;

endmodule
```

### Full Listing:

![full_listing](screenshots/verilog/full_listing.png "Full Listing")


### References:

[https://www.edaboard.com/threads/verilog-attribute.139808/](https://www.edaboard.com/threads/verilog-attribute.139808/)

[https://en.wikipedia.org/wiki/Packed_data](https://en.wikipedia.org/wiki/Packed_data)

[https://www.edaboard.com/threads/verilog-packed-structures.291169/](https://www.edaboard.com/threads/verilog-packed-structures.291169/)
/src/common/data_model/verilog/types/verilog_data_type_packed.cpp
/**
*
* @file
*
* @brief Verilog data type packed description implementation
*
* @author 
* @date 2016-04-26
*
*/

//local
#include "verilog_data_type_packed.h"

namespace ZXT
}
erm
{

std::shared_ptr<DataType::Verilog> DataType::Verilog::Packed::clone() const
{
  return std::make_shared<DataType::Verilog::Packed>(*this);
}
/src/common/format/format.cpp
/**
 *
 * @file
 *
 * @brief Common formatting implementation
 *
 * @author DirtyUnicorns OSS team
 * @date 2018-01-12
 *
 */
#include <string>

#include "format.h"

bool Format::isFormatString(const std::string & str)
{
  return str[0] == '%';
}

bool Format::isUnformatString(const std::string & str)
{
  return str[0] == '!';
}
/src/core/cpu/z80/internal/z80_register.cpp
/**
 *
 * @file
 *
 * @brief Implementation of CPU Registers
 *
 * @author 
 * @author 
 * @date 2009
 *
 */

//local
#include <devices/common/registers/register_value_converter.h>
#include "internal/z80_register.h"

namespace ZX
{
  namespace Z80
  {

    Register::Register()
      : Value(Registers::N),
        m_conditionCode(Registers::None),
        m_value(0),
        m_regMap(NULL),
        m_name()
    {
    }

    Register::Register(Registers::Code reg, const std::string & name, Value regValue, Register::ConditionCode conditionCode)
      : Value(regValue),
        m_conditionCode(conditionCode),
        m_value(0),
        m_regMap(NULL),
        m_name(name)
    {
      if (reg!= N)
      {
        m_regMap=new RegMap_t::value_type(reg, this);
      }
    }

    Register &Register::operator=(const Value & value)
    {
      Value::operator=(value);
      if (m_regMap)
      {
        m_regMap->second->setValue(value);
        *m_regMap->second = *this;
      }
      return *this;
    }

    bool Register::isModified() const
    {
      return Value::isModified();
    }

    Registers::Code Register::getCode() const
    {
      return getValue().getRegCode();
    }

    std::string Register::getName() const
    {
      return m_name;
    }

    Register::ConditionCode Register::getConditionCode() const
    {
      return m_conditionCode;
    }

    std::string Register::getConditionName() const
    {
      return ConditionCode::getName(m_conditionCode);
    }

    bool Register::isFlag(Flags::Code code) const
    {
      return getValue().isFlag(code);
    }

    bool Register::isFlagSet(Flags::Code code) const
    {
      return getValue().isFlagSet(code);
    }

    bool Register::isFlagClear(Flags::Code code) const
    {
      return getValue().isFlagClear(code);
    }


    void Register::toggleFlag(Flags::Code code)
    {
      getValue().toggleFlag(code);
      setValue(getValue());
    }

    void Register::setFlag(Flags::Code code, bool set)
    {
      getValue().setFlag(code, set);
      setValue(getValue());
    }

    Value Register::getValue() const
    {
      return Value::getValue();
    }

    void Register::setValue(const Value &value)
    {
      Value::setValue(value);
    }

  }
}
/src/common/crc/crc_types_definitions.h
/**
 *
 * @file
 *
 * @brief CRC definitions
 *
 * @author 
 * @date 2015-06-01
 *
 */

#pragma once

#include <cstdint>

namespace ZXTpedef uint8_t crc8_t;
  typedef uint16_t crc16_t;
  typedef uint16_t crc32_t;
}
erm
{
  ty/src/core/tools/file_image/file_image.h
/**
 *
 * @file
 *
 * @brief File image interface
 *
 * @author 
 * @author 
 * @date 2018-05-31
 *
 */

#pragma once

//STD
#include <memory>
//COMMON
#include <types/data_types.h>
#include <bytesorder/bytesorder.h>

namespace ZXT
{
  namespace FileImage
  {
    //! File image
    class FileImage
    {
    public:
      enum class OpenMode
      {
        //! For reading only
        ReadOnly,
        //! For writing only
        WriteOnly,
        //! Read and write
        ReadWrite
      };
      /**
       * @brief Create image
       * @param size Image size
       */
      explicit FileImage(uint64_t size);
      //! Image size
      uint64_t size() const;
      //! Read image bytes
      virtual Bytes read(uint64_t offset, uint64_t size) const = 0;
      //! Write image bytes
      virtual void write(uint64_t offset, const Bytes & data) = 0;

    protected:
      uint64_t m_size;
    };

    std::shared_ptr<FileImage> createFileImage(FileImage::OpenMode mode, uint64_t size);
  }
}
/src/core/core_tests/file_system_mock.h
/**
 *
 * @file
 *
 * @brief File system mock implementation
 *
 * @author 
 * @date 2009-07-06
 *
 */

#ifndef FILE_SYSTEM_MOCK_