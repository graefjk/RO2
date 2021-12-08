create_project project_ram ./project_ram -part xc7z010clg400-1 
add_files -norecurse [glob ./ram.vhd]
add_files -fileset sim_1 -norecurse ./ram_tb.vhd
add_files -fileset constrs_1 -norecurse ./constraint.xdc  
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
reset_run synth_1
set_property -name {xsim.simulate.runtime} -value {800ns} -objects [get_filesets sim_1]
#restart
#run 10 ns
