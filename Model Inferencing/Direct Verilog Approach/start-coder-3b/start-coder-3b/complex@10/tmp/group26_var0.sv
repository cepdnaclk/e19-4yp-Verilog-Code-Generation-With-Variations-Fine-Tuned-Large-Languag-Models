module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
always @(posedge ClockIn)
if (Reset==1'b1)
begin
Adjr = 2'b01;
HiCount = 2'b0;
end
else if (PLLClock==1'b1)
HiCount = HiCount + 2'b01;
else begin
case (HiCount)
2'b00: Adjr = 2'b11;
HiCount = 2'b0;
default: Adjr = 2'b00;
HiCount = 2'b0;
endcase
end
endmodule

### Results:
![Testbench Result](/assets/images/testbench_result_posedge_2.png)
/*
 * Copyright (C) 2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <android/log.h>
#include <stdint.h>
#include <sys/resource.h>

#include <cutils/ashmem-host.h>
#include <linux/compiler.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "cutils/multiuser.h"
#include "cutils/open_memstream.h"
#include "linker/boot_command.h"
#include "linker/linker.h"
#include "linker/linker_module.h"
#include "linker/linker_module_id.h"
#include "linker/linker_properties.h"

#include "cutils/properties.h"
#include "linker/linker_cache.h"
#include "linker/linker_cache_module.h"
#include "linker/linker_cache_system.h"
#include "linker/linker_cache_test