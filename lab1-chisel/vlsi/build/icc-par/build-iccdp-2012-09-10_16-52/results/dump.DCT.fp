###################################################################

# Created by write_floorplan on Mon Sep 10 16:53:13 2012

###################################################################
undo_config -disable

remove_die_area 

create_die_area  \
	-poly {	{0.000 0.000} {134.880 0.000} {134.880 134.880} {0.000 134.880} {0.000 0.000}} 
set oldSnapState [set_object_snap_type -enabled false]

#*********
#  Row  
# obj#: 26 
# objects are in arbitrary ordering 
#*********

remove_core_area -verbose

create_core_area  \
	-name unit    \
	-tile unit  \
	-direction horizontal \
	-coordinate {{30.000 30.000} {104.880 104.880}} 

cut_row -all

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 30.000} {104.880 32.880}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 32.880} {104.880 35.760}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 35.760} {104.880 38.640}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 38.640} {104.880 41.520}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 41.520} {104.880 44.400}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 44.400} {104.880 47.280}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 47.280} {104.880 50.160}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 50.160} {104.880 53.040}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 53.040} {104.880 55.920}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 55.920} {104.880 58.800}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 58.800} {104.880 61.680}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 61.680} {104.880 64.560}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 64.560} {104.880 67.440}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 67.440} {104.880 70.320}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 70.320} {104.880 73.200}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 73.200} {104.880 76.080}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 76.080} {104.880 78.960}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 78.960} {104.880 81.840}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 81.840} {104.880 84.720}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 84.720} {104.880 87.600}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 87.600} {104.880 90.480}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 90.480} {104.880 93.360}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 93.360} {104.880 96.240}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 96.240} {104.880 99.120}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-area {{30.000 99.120} {104.880 102.000}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-no_snap_to_wire_track \
	-dont_snap_to_existing_row \
	-flip_first_row \
	-area {{30.000 102.000} {104.880 104.880}}

update_floorplan

remove_bounds -all



#***************

#  Pre Route  

#***************

remove_net_shape *
remove_via *
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 66.37}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 56.13}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 51.01}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 45.89}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 35.65}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 30.53}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 25.41}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 15.17}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 10.05}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 65.31}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 55.07}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 49.95}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 44.83}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 34.59}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 29.47}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 24.35}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 14.11}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 8.99}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 1.04 -route_type pg_ring -length 132.38 -origin {1.25 2.62}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 1.04 -route_type pg_ring -length 133.82 -origin {0.53 1.05}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 127.81}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 117.57}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 112.45}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 107.33}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 97.09}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 91.97}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 86.85}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 76.61}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 132.38 -origin {1.25 71.49}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 126.75}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 116.51}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 111.39}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 106.27}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 96.03}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 90.91}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 85.79}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 75.55}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 0.52 -route_type pg_strap -length 133.82 -origin {0.53 70.43}
create_net_shape -no_snap -type wire -net VSS -layer M9 -datatype 0 -path_type 0 -width 1.04 -route_type pg_ring -length 132.38 -origin {1.25 132.26}
create_net_shape -no_snap -type wire -net VDD -layer M9 -datatype 0 -path_type 0 -width 1.04 -route_type pg_ring -length 133.82 -origin {0.53 133.83}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {128.16 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {124.32 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {120.48 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {116.64 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {112.8 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {108.96 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {105.12 2.1}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {127.68 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {123.84 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {120 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {116.16 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {112.32 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {108.48 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {104.64 0.53}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.48 -route_type pg_ring -length 130.68 -origin {133.39 2.1}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.48 -route_type pg_ring -length 133.82 -origin {134.11 0.53}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {97.44 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {93.6 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {89.76 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {85.92 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {82.08 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {78.24 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {74.4 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {70.56 2.1}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {96.96 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {93.12 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {89.28 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {85.44 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {81.6 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {77.76 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {73.92 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {70.08 0.53}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {66.72 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {62.88 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {55.2 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {51.36 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {47.52 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {43.68 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {39.84 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {36 2.1}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {66.24 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {62.4 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {54.72 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {50.88 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {47.04 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {43.2 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {39.36 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {35.52 0.53}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {32.16 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {28.32 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {24.48 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {20.64 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {12.96 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {9.12 2.1}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 130.68 -origin {5.28 2.1}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {31.68 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {27.84 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {24 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {20.16 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {12.48 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {8.64 0.53}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.24 -route_type pg_strap -length 133.82 -origin {4.8 0.53}
create_net_shape -no_snap -type wire -vertical -net VSS -layer M8 -datatype 0 -path_type 0 -width 0.48 -route_type pg_ring -length 130.68 -origin {1.49 2.1}
create_net_shape -no_snap -type wire -vertical -net VDD -layer M8 -datatype 0 -path_type 0 -width 0.48 -route_type pg_ring -length 133.82 -origin {0.77 0.53}
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 30.53} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 25.41} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 15.17} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 10.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 29.47} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 24.35} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 14.11} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 8.99} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {127.68 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {123.84 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {120 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {116.16 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {112.32 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {108.48 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {104.64 1.05} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_ring -at {133.39 2.62} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_ring -at {134.11 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {96.96 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {93.12 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {89.28 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {85.44 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {81.6 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {77.76 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {73.92 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {70.08 1.05} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 66.37} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 56.13} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 51.01} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 45.89} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 35.65} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 65.31} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 55.07} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 49.95} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 44.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 34.59} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {66.24 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {62.4 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {54.72 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {50.88 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {47.04 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {43.2 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {39.36 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {35.52 1.05} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 30.53} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 25.41} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 15.17} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 10.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 29.47} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 24.35} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 14.11} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 8.99} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {31.68 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {27.84 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {24 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {20.16 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {12.48 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {8.64 1.05} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {4.8 1.05} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_ring -at {1.49 2.62} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_ring -at {0.77 1.05} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 66.37} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 56.13} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 51.01} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 45.89} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 35.65} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 65.31} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 55.07} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 49.95} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 44.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 34.59} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 97.09} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 91.97} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 86.85} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 76.61} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 71.49} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 96.03} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 90.91} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 85.79} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 75.55} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 70.43} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 127.81} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 117.57} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 112.45} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {133.39 107.33} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 126.75} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 116.51} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 111.39} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {134.11 106.27} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {127.68 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {123.84 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {120 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {116.16 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {112.32 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {108.48 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {104.64 133.83} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_ring -at {133.39 132.26} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_ring -at {134.11 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {96.96 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {93.12 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {89.28 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {85.44 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {81.6 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {77.76 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {73.92 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {70.08 133.83} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 97.09} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 91.97} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 86.85} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 76.61} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 71.49} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 96.03} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 90.91} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 85.79} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 75.55} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 70.43} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {66.24 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {62.4 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {54.72 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {50.88 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {47.04 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {43.2 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {39.36 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {35.52 133.83} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 127.81} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 117.57} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 112.45} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_strap -at {1.49 107.33} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 126.75} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 116.51} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 111.39} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {0.77 106.27} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {31.68 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {27.84 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {24 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {20.16 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {12.48 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {8.64 133.83} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_strap -at {4.8 133.83} -orient N
create_via -no_snap -type via -net VSS -master VIA89C -route_type pg_ring -at {1.49 132.26} -orient N
create_via -no_snap -type via -net VDD -master VIA89C -route_type pg_ring -at {0.77 133.83} -orient N


set_object_snap_type -enabled $oldSnapState
undo_config -enable
