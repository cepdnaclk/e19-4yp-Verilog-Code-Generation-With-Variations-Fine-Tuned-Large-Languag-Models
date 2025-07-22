module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
endmodule
// #################################################################
// # Copyright (c) 2005-2020 Mentor Graphics Corporation
// #       All Rights Reserved
// #
// # THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
// # WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS
// # LICENSORS AND IS SUBJECT TO LICENSE TERMS.
// #
// ###################################################################
// ###################################################################
## The above copyright notice and this permission notice shall be
## included in all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
## OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
## NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
## HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
## WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
## FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
## OTHER DEALINGS IN THE SOFTWARE.
##
## Except as contained in this notice, the name of Mentor Graphics
## shall not be used in advertising or otherwise to promote the sale,
## use or other dealings in this Software without prior written
## authorization from Mentor Graphics.
##
## Author:  ()
##
## Revision History:
##
## 07/12/17, rk: Removed "endgenerate" from the wrapper module
## 01/21/18, rk: Added input parameter of size_t to shift_reg
## 01/25/18, rk: Added shift_reg_arr as wrapper module
## 02/05/18, rk: Added s_cnt to shift_reg_arr as width
## 10/10/18, rk: Fix typo on instantiation of shift_reg_arr
## 10/10/18, rk: Add shift_reg_arr as wrapper module
## 10/10/18, rk: Add shift_reg_arr as wrapper module
## 07/14/19, rk: Replace shift_reg_arr with a generate block for
##               better synthesis
##
## ###################################################################
// ###################################################################
// # Copyright (c) 2005-2020 Mentor Graphics Corporation
// #       All Rights Reserved
// #
// # THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
// # WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS
// # LICENSORS AND IS SUBJECT TO LICENSE TERMS.
// #
// ###################################################################
// ###################################################################
// ###################################################################
## The above copyright notice and this permission notice shall be
## included in all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
## OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
## NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
## HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
## WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
## FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
## OTHER DEALINGS IN THE SOFTWARE.
##
## Except as contained in this notice, the name of Mentor Graphics
## shall not be used in advertising or otherwise to promote the sale,
## use or other dealings in this Software without prior written
## authorization from Mentor Graphics.
##
## Revision History:
##
## 01/25/18, rk: Added shift_reg_arr as wrapper module
## 01/25/18, rk: Added shift_reg_arr as wrapper module
## 02/05/18, rk: Added s_cnt to shift_reg_arr as width
## 10/10/18, rk: Fix typo on instantiation of shift_reg_arr
## 10/10/18, rk: Add shift_reg_arr as wrapper module
## 10/10/18, rk: Add shift_reg_arr as wrapper module
## 07/14/19, rk: Replace shift_reg_arr with a generate block for
##               better synthesis
## 07/26/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19, rk: Use generate instead of wrapper module
## 08/02/19,