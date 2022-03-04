import csv
import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("Fig5coutput2.dat")


x = data[8920000:8950000,0]
va = data[8920000:8950000,1]
vb = data[8920000:8950000,3]
vc = data[8920000:8950000,5]




plt.plot(x,va)	
plt.plot(x,vb)	
plt.plot(x,vc)	
plt.legend(["Main","Priamry","Secondary"])	
plt.ylabel('Vm (mV)')
plt.xlabel('Time (ms)')





plt.show()
