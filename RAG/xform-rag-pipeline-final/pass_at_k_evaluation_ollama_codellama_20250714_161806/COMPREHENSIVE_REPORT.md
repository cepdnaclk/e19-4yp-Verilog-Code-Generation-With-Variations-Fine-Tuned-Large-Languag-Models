# Comprehensive Pass@k Evaluation Report

**Generated:** 2025-07-14 20:54:11
**Model:** ollama:codellama
**Endpoint:** N/A
**K Values:** [1, 3, 5, 10]
**Max Attempts per Task:** 10

## 🎯 Overall Results

- **Overall Pass@1**: 60.0%
- **Overall Pass@3**: 73.3%
- **Overall Pass@5**: 93.3%
- **Overall Pass@10**: 93.3%

- **Total Tasks**: 15
- **Successful Tasks**: 14 (93.3%)
- **Total Attempts**: 150
- **Successful Attempts**: 84 (56.0%)
- **Average Score**: 0.555
- **Average Best Score**: 0.802

## 📊 Results by Category

### Basic Tasks

- **Pass@1**: 75.0%
- **Pass@3**: 100.0%
- **Pass@5**: 100.0%
- **Pass@10**: 100.0%
- **Tasks**: 4/4
- **Average Score**: 0.709
- **Average Best Score**: 0.847
- **Evaluation Time**: 2161.5s

#### Individual Task Results:

- **wire_to_reg**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.823, Avg: 0.766
- **signal_rename**: Pass@1: 0%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.771, Avg: 0.575
- **module_name_change**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.967, Avg: 0.812
- **signal_width_change**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.825, Avg: 0.684

### Intermediate Tasks

- **Pass@1**: 75.0%
- **Pass@3**: 75.0%
- **Pass@5**: 100.0%
- **Pass@10**: 100.0%
- **Tasks**: 4/4
- **Average Score**: 0.588
- **Average Best Score**: 0.810
- **Evaluation Time**: 5724.3s

#### Individual Task Results:

- **multi_signal_width**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.827, Avg: 0.686
- **reset_condition_change**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.850, Avg: 0.637
- **add_enable_signal**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.845, Avg: 0.508
- **array_base_type_change**: Pass@1: 0%, Pass@3: 0%, Pass@5: 100%, Pass@10: 100%, Best: 0.718, Avg: 0.522

### Advanced Tasks

- **Pass@1**: 42.9%
- **Pass@3**: 57.1%
- **Pass@5**: 85.7%
- **Pass@10**: 85.7%
- **Tasks**: 7/7
- **Average Score**: 0.449
- **Average Best Score**: 0.771
- **Evaluation Time**: 8679.1s

#### Individual Task Results:

- **fsm_state_rename**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.837, Avg: 0.738
- **queue_mda_conversion**: Pass@1: 0%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.694, Avg: 0.281
- **dynamic_mda_conversion**: Pass@1: 0%, Pass@3: 0%, Pass@5: 100%, Pass@10: 100%, Best: 0.811, Avg: 0.295
- **associative_mda_conversion**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.798, Avg: 0.636
- **inside_op_coverage**: Pass@1: 0%, Pass@3: 0%, Pass@5: 0%, Pass@10: 0%, Best: 0.582, Avg: 0.284
- **advanced_debug_insertion**: Pass@1: 100%, Pass@3: 100%, Pass@5: 100%, Pass@10: 100%, Best: 0.949, Avg: 0.566
- **performance_optimization**: Pass@1: 0%, Pass@3: 0%, Pass@5: 100%, Pass@10: 100%, Best: 0.730, Avg: 0.340

## 📋 Detailed Task Analysis

| Task Name | Category | Complexity | Pass@1 | Pass@3 | Pass@5 | Pass@10 | Best Score | Avg Score |
|-----------|----------|------------|--------|--------|--------|---------|------------|-----------|
| wire_to_reg | signal_modification | simple | 100% | 100% | 100% | 100% | 0.823 | 0.766 |
| signal_rename | signal_modification | simple | 0% | 100% | 100% | 100% | 0.771 | 0.575 |
| module_name_change | structural_modification | simple | 100% | 100% | 100% | 100% | 0.967 | 0.812 |
| signal_width_change | signal_modification | simple | 100% | 100% | 100% | 100% | 0.825 | 0.684 |
| multi_signal_width | signal_modification | medium | 100% | 100% | 100% | 100% | 0.827 | 0.686 |
| reset_condition_change | control_logic | medium | 100% | 100% | 100% | 100% | 0.850 | 0.637 |
| add_enable_signal | feature_addition | medium | 100% | 100% | 100% | 100% | 0.845 | 0.508 |
| array_base_type_change | type_modification | medium | 0% | 0% | 100% | 100% | 0.718 | 0.522 |
| fsm_state_rename | fsm_modification | complex | 100% | 100% | 100% | 100% | 0.837 | 0.738 |
| queue_mda_conversion | advanced_arrays | complex | 0% | 100% | 100% | 100% | 0.694 | 0.281 |
| dynamic_mda_conversion | advanced_arrays | complex | 0% | 0% | 100% | 100% | 0.811 | 0.295 |
| associative_mda_conversion | advanced_arrays | complex | 100% | 100% | 100% | 100% | 0.798 | 0.636 |
| inside_op_coverage | verification | novel | 0% | 0% | 0% | 0% | 0.582 | 0.284 |
| advanced_debug_insertion | debug_enhancement | novel | 100% | 100% | 100% | 100% | 0.949 | 0.566 |
| performance_optimization | optimization | novel | 0% | 0% | 100% | 100% | 0.730 | 0.340 |


## ⚙️ Configuration Details

**Model Configuration:**
- Type: ollama
- Name: codellama
- Endpoint: Local/Default

**Evaluation Configuration:**
- K Values: [1, 3, 5, 10]
- Attempts per Task: 10
- Pass Threshold: 0.6
- Embedding Model: sentence-transformers/all-MiniLM-L6-v2

**Task Categories:**
- Basic: Simple transformations (wire-to-reg, renaming, etc.)
- Intermediate: Medium complexity (multi-signal, reset conditions, etc.)
- Advanced: Complex transformations (FSM, arrays, novel features)
