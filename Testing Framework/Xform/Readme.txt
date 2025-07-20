# Commands for running transformations using run_pipeline.py

# 1. Change reg variables to wire
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/1_xform_reg_to_wire.py --input-file 0_simple_counter.v --output-file 1_simple_counter_wire_f.v --ground-truth-file 1_simple_counter_wire.v --task-name reg_to_wire --complexity simple --output-dir pipeline_results --xform-args target_variable=count

# 2. Change module name
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/2_xform_module_name.py --input-file 0_simple_counter.v --output-file 2_simple_counter_renamed_f.v --ground-truth-file 2_simple_counter_renamed.v --task-name module_name --complexity simple --output-dir pipeline_results --xform-args from_name=simple_counter to_name=advanced_counter

# 3. Rename ports in a module
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/3_xform_rename_port.py --input-file 0_simple_counter.v --output-file 3_simple_counter_port_renamed_f.v --ground-truth-file 3_simple_counter_port_renamed.v --task-name port_rename --complexity simple --output-dir pipeline_results --xform-args from_name=count_out to_name=counter_output

# 4. Transform reset condition
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/4_xform_change_reset_condition.py --input-file 0_simple_counter.v --output-file 4_simple_counter_reset_f.v --ground-truth-file 4_simple_counter_reset.v --task-name reset_condition --complexity simple --output-dir pipeline_results --xform-args reset_signal=rst active_high_to_low=high_to_low

# 5. Change a signal's width
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/5_xform_change_signal_width.py --input-file 0_simple_counter.v --output-file 5_simple_counter_width_f.v --ground-truth-file 5_simple_counter_width.v --task-name signal_width --complexity simple --output-dir pipeline_results --xform-args signal_name=count new_width=15:0

# 6. Add an enable signal to a counter
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/6_xform_add_enable_signal.py --input-file 0_counter_with_enable.v --output-file 6_counter_with_enable_f.v --ground-truth-file 6_counter_with_enable.v --task-name add_enable --complexity simple --output-dir pipeline_results --xform-args enable_name=new_enable counter_name=count

# 7. Transform to fixed-range multi-dimensional arrays
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/7_xform_range_mda.py --input-file 0_simple_array_example.v --output-file 7_range_output_f.v --ground-truth-file 7_range_output.v --task-name fixed_range_mda --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array ranges=7:0 ranges=0:15

# 8. Transform to dynamic multi-dimensional arrays
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/8_xform_dynamic_mda.py --input-file 0_simple_array_example.v --output-file 8_dynamic_output_f.v --ground-truth-file 8_dynamic_output.v --task-name dynamic_mda --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array dimensions=2

# 9. Transform to queue-based multi-dimensional arrays (1D queue)
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/9_xform_queue_mda.py --input-file 0_simple_array_example.v --output-file 9_queue_output_f.v --ground-truth-file 9_queue_output.v --task-name queue_mda --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array dimensions=1

# 10. Transform to bounded queue-based multi-dimensional arrays
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/10_xform_queue_mda.py --input-file 0_simple_array_example.v --output-file 10_bounded_queue_output_f.v --ground-truth-file 10_bounded_queue_output.v --task-name queue_mda_bounded --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array dimensions=1 bounded=True bound_size=10

# 11. Transform to associative array with string key
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/11_xform_associative_mda.py --input-file 0_simple_array_example.v --output-file 11_assoc_string_output_f.v --ground-truth-file 11_assoc_string_output.v --task-name associative_mda_string --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array key_type=string

# 12. Transform to associative array with wildcard key
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/12_xform_associative_mda.py --input-file 0_simple_array_example.v --output-file 12_assoc_wildcard_output_f.v --ground-truth-file 12_assoc_wildcard_output.v --task-name associative_mda_wildcard --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array key_type=wildcard

# 13. Transform to associative array with vector key
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/13_xform_associative_mda.py --input-file 0_simple_array_example.v --output-file 13_assoc_vector_output_f.v --ground-truth-file 13_assoc_vector_output.v --task-name associative_mda_vector --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array key_type=vector

# 14. Transform to associative array with class key
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/14_xform_associative_mda.py --input-file 0_simple_array_example.v --output-file 14_assoc_class_output_f.v --ground-truth-file 14_assoc_class_output.v --task-name associative_mda_class --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array key_type=class

# 15. Transform to mixed multi-dimensional arrays
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/15_xform_mixed_mda.py --input-file 0_simple_array_example.v --output-file 15_mixed_output_f.v --ground-truth-file 15_mixed_output.v --task-name mixed_mda --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array mda_spec=fixed:7:0 mda_spec=assoc:string mda_spec=queue

# 16. Transform to associative array with specific key type (e.g., integer)
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/16_xform_associative_mda_key_type.py --input-file 0_simple_array_example.v --output-file 16_assoc_int_output_f.v --ground-truth-file 16_assoc_int_output.v --task-name associative_mda_key_type --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array key_type=integer

# 17. Transform array base type
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/17_xform_array_base_type.py --input-file 0_simple_array_example.v --output-file 17_array_base_output_f.v --ground-truth-file 17_array_base_output.v --task-name array_base_type --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array base_type=int

# 18. Transform to specific structure type
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/18_xform_structure_type.py --input-file 0_simple_array_example.v --output-file 18_struct_output_f.v --ground-truth-file 18_struct_output.v --task-name structure_type --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array struct_type=packed

# 19. Add test case for arrays in inside operator
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/19_xform_inside_op_array.py --input-file 0_simple_array_example.v --output-file 19_inside_array_output_f.v --ground-truth-file 19_inside_array_output.v --task-name inside_op_array --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array test_type=array_as_whole

# 20. Add test case for inside operator in different contexts
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/20_xform_inside_op_context.py --input-file 0_simple_array_example.v --output-file 20_inside_context_output_f.v --ground-truth-file 20_inside_context_output.v --task-name inside_op_context --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array context_type=if_statement

# 21. Add test case for inside operator in different scopes
python3 run_pipeline.py --xform-dirs codelama --xform-file codelama/21_xform_inside_op_scope.py --input-file 0_simple_array_example.v --output-file 21_inside_scope_output_f.v --ground-truth-file 21_inside_scope_output.v --task-name inside_op_scope --complexity simple --output-dir pipeline_results --xform-args signal_name=mem_array scope_type=module