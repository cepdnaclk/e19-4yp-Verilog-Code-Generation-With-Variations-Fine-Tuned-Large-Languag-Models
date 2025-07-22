module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
{
  integer unsigned i;
  initial begin
    for (i = 0; i < 4; i++) begin
      if (i1[i] && (i2[i] || i1[i])) // <--- this is the condition
        o[i] = '1';
      else if (i1[i])
        o[i] = '1';
      else if (i2[i])
        o[i] = '1';
      else
        o[i] = '0';
    end
  end
end
endmodule
### Expected Results:
In the first case, the result should be 1. In the second case, the result should be X.
### Generated Testbench:
1:    reg [0:3] i1,i2,o;
2:    initial begin
3:      for (i = 0; i < 4; i++) begin
4:        if (i1[i] && (i2[i] || i1[i])) // <--- this is the condition
5:          o[i] = '1';
6:        else if (i1[i])
7:          o[i] = '1';
8:        else if (i2[i])
9:          o[i] = '1';
10:        else
11:          o[i] = '0';
12:      end
13:    end
14:    endmodule
### Result:
testbench.v:20: ERROR: Parameter file in the testbench does not have an instruction with number 20.
/*
 * Copyright (c) 2009 The University of Michigan
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include "m5/stat/recordable.hh"

#include <fmt/format.h>

#include "base/logging.hh"
#include "base/trace.hh"
#include "debug/Stats.hh"
#include "params/StatRecorder.hh"
#include "sim/core.hh"
#include "sim/manager.hh"

namespace {

constexpr int max_depth = 10;

int indent = 1;

}

namespace m5 {

StatRecorder::StatRecorder(const StatRecorderParams &p)
    : BaseObject(p), indent(p.indent)
{
    init(p.record_depth);
}

StatRecorder::~StatRecorder() {
    TRACE_ASSERT(!enabled);
    // Delete the stats map.
    for (auto &pair : statsMap)
        delete pair.second;
}

void
StatRecorder::recordStat(const std::string &path, uint64_t count)
{
    if (enabled) {
        std::vector<std::string> tokens;
        split(path, tokens, "/");

        std::map<std::string, StatRecordable *>::iterator pos;
        std::string last_key;

        StatRecordable *current = this;
        for (auto token : tokens) {
            pos = current->statsMap.find(token);
            if (pos == current->statsMap.end()) {
                if (tokens.size()!= (current->depth + 1)) {
                    // If current depth is not the last key in the path,
                    // create the current path.
                    std::string prev_key = pos == current->statsMap.end()?
                        last_key : pos->first;
                    current = current->createPath(prev_key, token);
                }
                else {
                    // If current depth is the last key already set,
                    // create the current stat.
                    std::string prev_key = pos == current->statsMap.end()?
                        last_key : pos->first;
                    current = current->createStat(prev_key, token);
                }
                continue;
            }

            // Move to the child node.
            current = pos->second;
        }

        TRACE_ASSERT(current->depth == tokens.size() - 1);
        TRACE_ASSERT(current->parent == this);
        current->set(count);
    }
}

void
StatRecorder::init(int depth)
{
    if (depth < 0)
        depth = max_depth;

    record_depth = depth;

    if (record_depth > 0) {
        enabled = 1;
        indent = 1;
    }
}

StatRecordable *
StatRecorder::createPath(const std::string &prev_key, const std::string &key)
{
    auto path = std::make_unique<StatRecordable>(prev_key + "/" + key, this,
        this->depth + 1);
    path->parent = this;
    path->parent->statsMap.emplace(key, path->get());
    return path->get();
}

StatRecordable *
StatRecorder::createStat(const std::string &prev_key, const std::string &key)
{
    auto stat = std::make_unique<StatRecordable>(prev_key + "/" + key,
        this, this->depth + 1);
    stat->parent = this;
    stat->parent->statsMap.emplace(key, stat.release());
    return stat->get();
}

void
StatRecordable::set(uint64_t count)
{
    this->count += count;
}

void
StatRecordable::clear()
{
    this->count = 0;
}

void
StatRecordable::dump(bool all)
{
    for (auto &stat : statsMap)
        stat.second->dump(all);
}

void
StatRecordable::dump(bool all, const std::string &indent)
{
    if (this->count!= 0 || all)
        for (int i = 0; i < this->depth * indent.length(); i++)
            fprintf(stderr, " ");
        fprintf(stderr, "%s %" PRIu64 "\n", this->path.c_str(), this->count);

    for (auto &stat : statsMap)
        stat.second->dump(all, indent);
}

void
StatRecordable::print(std::ostream &os)
{
    for (int i = 0; i < this->depth * indent; i++)
        os << " ";
    os << this->path << " " << this->count << std::endl;

    for (auto &stat : statsMap)
        stat.second->print(os);
}

} // namespace m5
/*
 * Copyright (c) 2015,  and 
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A