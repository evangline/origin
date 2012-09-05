
create_floorplan \
  	-control_type aspect_ratio \
  	-core_aspect_ratio 1 \
  	-core_utilization 0.5 \
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
  -template saed_32nm.tpl:m45_mesh(0.25,0.5) \
  -extension {stop: outermost_ring}

compile_power_plan -verbose

#stdcell rails
#set_preroute_drc_strategy \
  -min_layer M1 \
  -max_layer M4

preroute_standard_cells \
  -nets {VDD VSS} \
  -connect horizontal \
  -route_pins_on_layer "M1" \
  -extend_to_boundaries_and_generate_pins \
  -fill_empty_rows

#set_preroute_drc_strategy

#create_fp_placement

verify_pg_nets
