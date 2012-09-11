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

def DFFCount (report):
  f_report=open(report)
  count=[]
  sum=[]
  summation=0
  for line in f_report:
    
    if 'DFF' in line:
      spline=line.rsplit(' ',40)
      for i in range(len(spline)):
        if spline[i] != '':
          count.append(spline[i])
      sum.append(count[-3])
  for i in range(len(sum)):
    summation=summation+int(sum[i])
  f_report.close()
  return summation

def ColData (work_dir,dcsyn_dir,icc_dir,pt_dir,dcsyn_qor,dcsyn_pwr,icc_qor,icc_pwr,index):
  avg_pwr=  'vcdplus.power.avg.max.report'
  peak_pwr= 'vcdplus.power.time.max.report'
  spec=[]
  spec.append(ColValue(work_dir+dcsyn_dir+dcsyn_qor,'Critical Path Length:'))
  spec.append(ColValue(work_dir+dcsyn_dir+dcsyn_qor,'Design Area:'))
  spec.append(ColPower(work_dir+dcsyn_dir+dcsyn_pwr,index,-2))
  spec.append(ColValue(work_dir+icc_dir+icc_qor,'Critical Path Length:'))
  spec.append(ColValue(work_dir+icc_dir+icc_qor,'Design Area:'))
  spec.append(ColPower(work_dir+icc_dir+icc_pwr,index,-2))
  spec.append(ColPower(work_dir+pt_dir+avg_pwr,index-2,-2))
  spec.append(ColPower(work_dir+pt_dir+peak_pwr,index-2,-6))
  spec.append(DFFCount(work_dir+icc_dir+dff_count))
  return spec

print ColData(work_dir,dir_dcsyn,dir_icc,dir_pt,qor,pwr,icc_qor,icc_pwr,-4) #90nm
print ColData(work_dir_32b,dir_dcsyn,dir_icc,dir_pt,qor,pwr,icc_qor,icc_pwr,-4) #90nm_32b
print ColData(work_dir_32nm,dir_dcsyn,dir_icc,dir_pt,qor,pwr,icc_qor,icc_pwr,-4) #32nm
print ColData(work_dir_chs,dir_dcsyn,dir_icc,dir_pt,chs_qor,chs_pwr,icc_qor,icc_pwr,-2) #chisel
"""print '%40s %20s %20s' %('Unit', 'W=16', 'W=32')
print '%-30s'% ('P_Syn Crit Path Length')+'%-10s'%('ns'),
for i in range(3):
  print '%-20s'%(ColValue(work_dir[i]+dir_dcsyn,'Critical Path Length:')),
print '%-20s'%(ColValue(work_dir[3]+'','Critical Path Length:')"""
