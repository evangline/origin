#!/usr/bin/env python

import sys
import string

lab3    ='/scratch/cs250-af/lab3/vlsi/build/'
icc     ='icc-par/current-icc/reports/'
dc      ='dc-syn/current-dc/reports/'
pt      ='pt-pwr/current-pt/reports/'
qor_dc  ='convolutionFilter.mapped.qor.rpt' 
qor     ='chip_finish_icc.qor.rpt'
area    ='chip_finish_icc.area.rpt'
area_dc ='convolutionFilter.mapped.area.rpt'
pwr     ='vcdplus.power.avg.max.report'
pwr_dc  ='convolutionFilter.mapped.power.rpt'
ref_dc  ='convolutionFilter.mapped.reference.rpt'
ref     ='chip_finish_icc.reference.rpt'
#Collect critical path slack in qor report
def ColTiming(report):
  f_report=open(report)
  list_val=[]
  for line in f_report:
    if "Critical Path Slack" in line:
      temp=line.replace('Critical Path Slack:', '')
      list_val.append(temp.strip())
  f_report.close()
  return list_val[-1]

#Collect Area in icc area report
def ColArea(report):
  f_report=open(report)
  list_val=[]
  for line in f_report:
    if line.startswith('convolutionFilter'):
      list_val.append(line.split()[1])
    elif line.startswith('convolver'):
      list_val.append(line.split()[1])
    elif 'winBuf ' in line:
      list_val.append(line.split()[1])
  f_report.close()  
  return list_val

#Collect Power in post synthesis sim
def ColPower_dc (report,index):
  f_report=open(report)
  list_f=f_report.readlines()
  total= list_f[-4].split()[index]
  conv=  list_f[-3].split()[index]
  winbuf=list_f[-2].split()[index]
  return total,conv,winbuf

#Collect Power in prime time
def ColPower (report,index):
  f_report=open(report)
  list_f=f_report.readlines()
  total = list_f[-8].split()[index]
  conv = list_f[-4].split()[index]
  winbuf = list_f[-7].split()[index]
  f_report.close()
  return total,conv,winbuf

# Cell Count: HVT, RVT, LVT
def CellCount (report):
  f_report=open(report)
  HVT_sum=0;RVT_sum=0;LVT_sum=0
  for line in f_report:
    if '_HVT' in line:
      HVT_sum = HVT_sum + int(line.split()[3])
    elif '_RVT' in line:
      RVT_sum = RVT_sum + int(line.split()[3])
    elif '_LVT' in line:
      LVT_sum = LVT_sum + int(line.split()[3])
  f_report.close()
  return HVT_sum,RVT_sum,LVT_sum             #all cell count & dff count

f = open('data','w')
list_area_dc = ColArea(lab3+dc+area_dc)
list_area_icc = ColArea(lab3+icc+area)
tot_pwr_dc = ColPower_dc(lab3+dc+pwr_dc,-2)
sw_pwr_dc = ColPower_dc(lab3+dc+pwr_dc,-5)
int_pwr_dc = ColPower_dc(lab3+dc+pwr_dc,-4)
leak_pwr_dc = ColPower_dc(lab3+dc+pwr_dc,-3)
list_pwr_pt = ColPower(lab3+pt+pwr,-2)
list_cell_count = CellCount(lab3+dc+ref_dc)
list_cell_count_icc = CellCount(lab3+icc+ref)
f.write( '----------------------------------\n')
f.write( 'Post-synthesis result\n')
f.write( '----------------------------------\n')
f.write( 'Timing(Critical Path Slack):  %s\n' %ColTiming(lab3+dc+qor_dc))
f.write( 'Total Area:  %s\n' %list_area_dc[0] )
f.write( 'WindowBuffer Area:  %s\n' %list_area_dc[2])
f.write( 'WindowBuffer Area:  %s\n' %list_area_dc[2])
f.write( 'Convolution Area:  %s\n' %list_area_dc[1])
f.write( 'Total Power: %s uW\n' %tot_pwr_dc[0])
f.write( '     switch:  %s\n' %sw_pwr_dc[0])
f.write( '   internal:  %s\n' %int_pwr_dc[0])
f.write( '    leakage:  %s\n' %leak_pwr_dc[0])
f.write( 'WindowBuffer Power: %s uW\n' %tot_pwr_dc[2])
f.write( '     switch:  %s\n' %sw_pwr_dc[2])
f.write( '   internal:  %s\n' %int_pwr_dc[2])
f.write( '    leakage:  %s\n' %leak_pwr_dc[2])
f.write( 'Convolution Power: %s uW\n' %tot_pwr_dc[1])
f.write( '     switch:  %s\n' %sw_pwr_dc[1])
f.write( '   internal:  %s\n' %int_pwr_dc[1])
f.write( '    leakage:  %s\n' %leak_pwr_dc[1])
f.write( 'HVT cell count: %s\n' %list_cell_count[0])
f.write( 'RVT cell count: %s\n' %list_cell_count[1])
f.write( 'LVT cell count: %s\n' %list_cell_count[2])
f.write( '----------------------------------\n')
f.write( 'Post-place-and-route result\n')
f.write( '----------------------------------\n')
f.write( 'Timing(Critical Path Slack):%s\n' %ColTiming(lab3+icc+qor))
f.write( 'Total Area:  %s\n' %list_area_icc[0])
f.write( 'WindowBuffer Area:  %s\n' %list_area_icc[2])
f.write( 'Convolution Area:  %s\n' %list_area_icc[1])
f.write( 'Total Power: %s\n' %list_pwr_pt[0])
f.write( 'WindowBuffer Power: %s\n' %list_pwr_pt[2])
f.write( 'Convolution Power: %s\n' %list_pwr_pt[1])
f.write( 'HVT cell count: %s\n' %list_cell_count_icc[0])
f.write( 'RVT cell count: %s\n' %list_cell_count_icc[1])
f.write( 'LVT cell count: %s\n' %list_cell_count_icc[2])
f.write( '----------------------------------\n')
f.close()
