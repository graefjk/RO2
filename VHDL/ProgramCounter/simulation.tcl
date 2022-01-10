create_project project_pc ./project_pc -part xc7z010clg400-1
add_files -norecurse [glob ./PC_tb.vhd]
add_files -fileset sim_1 -norecurse ./PC_tb.vhd
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
reset_run synth_1
set_property -name {xsim.simulate.runtime} -value {10000ns} -objects [get_filesets sim_1]
launch_simulation
#restart
#run 10 ns
