#*************************************************
#  Created by Design Compiler Topographical write_floorplan
#  Version: F-2011.09-SP4
#  Date: Mon Sep 10 12:55:45 2012
#*************************************************



#*************************************************
#   SECTION: Terminals, with number: 0
#*************************************************

remove_terminal *



#*************************************************
#   SECTION: Core Area
#*************************************************

remove_core_area -verbose



#*************************************************
#   SECTION: Site Rows, with number: 0
#*************************************************
cut_row -all 

update_floorplan



#*************************************************
#   SECTION: Preroutes, with number: 0
#*************************************************

remove_net_shape *
remove_via *
remove_user_shape *
