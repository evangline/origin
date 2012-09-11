#! /usr/bin/python

import sys
import string

work_dir='/work/cs250-af/lab1-verilog/build/'
work_dir_32b='/work/cs250-af/lab1-verilog/build-32bit/'
work_dir_32nm='/work/cs250-af/lab1-verilog/build-32nm/'
work_dir_chs='/work/cs250-af/lab1-chisel/vlsi/build/'

dir_dcsyn='dc-syn/current-dc/reports/'
dir_icc=  'icc-par/current-icc/reports/'
dir_pt=   'pt-pwr/current-pt/reports/'
qor=      'gcdGCDUnit_rtl.mapped.qor.rpt'
icc_qor=  'chip_finish_icc.qor.rpt'
pwr=      'gcdGCDUnit_rtl.mapped.power.rpt'
icc_pwr=  'chip_finish_icc.power.rpt'
avg_pwr=  'vcdplus.power.avg.max.report'
peak_pwr= 'vcdplus.power.time.max.report'
chs_qor=  'GCD.mapped.qor.rpt'
chs_pwr=  'GCD.mapped.power.rpt' 
dff_count= 'chip_finish_icc.reference.rpt'
def ColValue (report,string):
  f_report=open(report)
  list_val=[]
  for line in f_report:
    if string in line:
      temp=line.replace(string, '')
      list_val.append(temp.strip())
  f_report.close()  
  return list_val[-1]


def ColPower (report,line,index):
  f_report=open(report)
  list_f=f_report.readlines()
  power=list_f[line].rsplit(' ',40)
  pwr=[]
  for i in range(len(power)):
    if power[i] != '':
      pwr.append(power[i])
  f_report.close()
  return pwr[index]

def DFFCount (report,index2):
  f_report=open(report)
  sum=[]
  summation=0
  dff=0
  list_f=f_report.readlines()
  for i in range(index2,len(list_f)):
    if list_f[i].startswith('----'):
      break
    spline=list_f[i].split(' ',40)
    temp=[]
    for j in range(len(spline)):     #remove all the '' in the array
      if spline[j] != '':
        temp.append(spline[j])
    if 'SNPS' in temp[0]:            #Exception
      summation=summation+int(temp[2])
    else: 
      summation=summation+int(temp[3])
    if 'DFF' in temp[0]:             #count DFF
      dff=dff+int(temp[3])
  f_report.close()
  return summation, dff              #all cell count & dff count

def ColData (work_dir,dcsyn_dir,icc_dir,pt_dir,dcsyn_qor,dcsyn_pwr,icc_qor,icc_pwr,index,index2,index3):
  avg_pwr=  'vcdplus.power.avg.max.report'
  peak_pwr= 'vcdplus.power.time.max.report'
  spec=[]
  spec.append(ColValue(work_dir+dcsyn_dir+dcsyn_qor,'Critical Path Length:')) #Post Syn Crit Path Length
  spec.append(ColValue(work_dir+dcsyn_dir+dcsyn_qor,'Design Area:'))          #Post Syn Area
  spec.append(ColPower(work_dir+dcsyn_dir+dcsyn_pwr,index,-2))                #Post Syn Power
  spec.append(ColValue(work_dir+icc_dir+icc_qor,'Critical Path Length:'))     #Post PaR Crit Path Lengh
  spec.append(ColValue(work_dir+icc_dir+icc_qor,'Design Area:'))              #Post PaR Area
  spec.append(ColPower(work_dir+icc_dir+icc_pwr,index,-2))                    #Post PaR Power
  spec.append(ColPower(work_dir+pt_dir+avg_pwr,index-2,-2))                   #PrimeTime Avg Power
  spec.append(ColPower(work_dir+pt_dir+peak_pwr,index-2,-6))                  #PrimeTime Peak Power
  spec.append(DFFCount(work_dir+icc_dir+dff_count,index2))                    #Cell count (for GCDUnitCtrl)
  spec.append(DFFCount(work_dir+icc_dir+dff_count,index3))                    #Cell count (for GCDUnitDpath)
#for Chisel only consider one part of of cell count
  return spec

print ColData(work_dir,dir_dcsyn,dir_icc,dir_pt,qor,pwr,icc_qor,icc_pwr,-4,34,56) #90nm
print ColData(work_dir_32b,dir_dcsyn,dir_icc,dir_pt,qor,pwr,icc_qor,icc_pwr,-4,36,62) #90nm_32b
print ColData(work_dir_32nm,dir_dcsyn,dir_icc,dir_pt,qor,pwr,icc_qor,icc_pwr,-4,36,62) #32nm
print ColData(work_dir_chs,dir_dcsyn,dir_icc,dir_pt,chs_qor,chs_pwr,icc_qor,icc_pwr,-2,21,21) #chisel
