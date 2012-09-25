#! /usr/bin/python

import sys
import string

lab2  ='/scratch/cs250-af/lab2/vlsi/'
rvt   ='build-rvt/'
mvt   ='build-multi-vt/'
sram  ='build-sram/'
icc   ='icc-par/current-icc/reports/'
pt    ='pt-pwr/current-pt/reports/'
area  ='chip_finish_icc.area.rpt'
qor   ='chip_finish_icc.qor.rpt'
pwr   ='vcdplus.power.avg.max.report'
ref   ='chip_finish_icc.reference.rpt'

#Collect Area in icc area report
def ColArea(report):
  f_report=open(report)
  list_val=[]
  for line in f_report:
    if line.startswith('medianFilter'):
      list_val.append(line.split()[1])
    elif line.startswith('medianSorter'):
      list_val.append(line.split()[1])
    elif 'winBuf ' in line:
      list_val.append(line.split()[1])
  f_report.close()  
  return list_val

#Collect Power in prime time
def ColPower (report):
  f_report=open(report)
  for line in f_report:
    if 'medianFilter' in line:
      total = line.strip('medianFilter').split()[2:4]
    elif 'medianSorter (median9)' in line:
      sorter =  line.strip('medianSorter (median9)').split()[2:4]
    elif 'winBuf (windowBuf)' in line:
      buf = line.strip('winBuf (windowBuf)').split()[2:4]
  f_report.close()
  return total,sorter,buf

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

def ColData (work_dir,build,icc,pt,area,ref,pwr):
  spec=[]
  spec.append(ColArea(work_dir+build+icc+area))                              #Post PaR Area
  spec.append(CellCount(work_dir+build+icc+ref))                             #Cell count HVT/RVT/LVT
  spec.append(ColPower(work_dir+build+pt+pwr))                               #PrimeTime Avg/Leakage pwr
  return spec

print 'area: total|sorting|buffer|||cell count:HVT|RVT|LVT|||Entire leak|all||Sorting leak|all||Buf leak|all'
print ColData(lab2,rvt,icc,pt,area,ref,pwr)
print ColData(lab2,mvt,icc,pt,area,ref,pwr)
print ColData(lab2,sram,icc,pt,area,ref,pwr)
