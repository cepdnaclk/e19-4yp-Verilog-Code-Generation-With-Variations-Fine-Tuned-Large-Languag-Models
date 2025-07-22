{% include "ad_mup_variation.sv" %}
### Differences from the base code:
- Variation Instruction:
Check `BCD_in` using `inside` operator with array select using XMR in index (e.g., `pkg::consts[BCD_in]`) to test XMR usage.