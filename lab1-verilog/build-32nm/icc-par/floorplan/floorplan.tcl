
#create_floorplan \

initialize_floorplan \
        -control_type aspect_ratio \
  	-core_aspect_ratio 1 \
        -core_utilization 0.7 \
  	-row_core_ratio 1 \
  	-left_io2core 5 \
  	-bottom_io2core 5 \
  	-right_io2core 5 \
  	-top_io2core 5 \
  	-start_first_row

derive_pg_connection -power_net VDD -power_pin VDD -create_port top
derive_pg_connection -ground_net VSS -ground_pin VSS -create_port top

synthesize_fp_rings \
  -nets {VDD VSS} \
  -core \
  -layers {M5 M4} \
  -width {1.25 1.25} \
  -space {0.5 0.5} \
  -offset {1 1}

set_power_plan_strategy core \
  -nets {VDD VSS} \
  -core \
  -template saed_32nm.tpl:m45_mesh(0.15,0.3) \
  -extension {stop: outermost_ring}

compile_power_plan -verbose

insert_stdcell_filler   \
        -cell_without_metal "SHFILL128_RVT SHFILL64_RVT SHFILL3_RVT SHFILL2_RVT SHFILL1_RVT" \
        -connect_to_power {VDD} \
        -connect_to_ground {VSS}

set_preroute_drc_strategy  -merge_thin_wires -report_fail -no_design_rul

preroute_standard_cells \
        -connect horizontal     \
        -port_filter_mode off   \
        -cell_master_filter_mode off    \
        -cell_instance_filter_mode off  \
        -voltage_area_filter_mode off

set_preroute_drc_strategy

remove_stdcell_filler   \
        -stdcell

#create_fp_placement

#set_preroute_drc_strategy  -ignore_same_net_check
#set_preroute_drc_strategy  -merge_thin_wires 
#set_preroute_drc_strategy  -no_design_rule -merge_thin_wires -report_fail
#
#preroute_standard_cells \
#  -nets {VDD VSS} \
#  -connect horizontal \
#  -route_pins_on_layer "M1" \
#  -fill_empty_sites
#set_preroute_drc_strategy

verify_pg_nets

