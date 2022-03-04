import csv
import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("Fig5coutput2.dat")

numrows = len(data)
numcols = len(data[0])


x = data[:,0]
va = data[:,1]
ana = data[:,2]
vb = data[:,3]
bna = data[:,4]
vc = data[:,5]
cna = data[:,6]
vc2 = data[:,7]
cna2 = data[:,8]

# x = data[21000000:23000000,0]
# potential = data[21000000:23000000,1]
# ina = data[21000000:23000000,2]
# ena = data[21000000:23000000,3]
# ik = data[21000000:23000000,4]
# ek = data[21000000:23000000,5]
# last = data[:,6]
# na = data[:,7]



		
# # plt.plot(x,potential)
# plt.plot(x,ina)	
# plt.plot(x,ena)	
# plt.plot(x,ik)			
# # plt.plot(x,50*np.multiply(cube,ik))	
# plt.legend(["ina","ika","ikd"])
# # plt.legend(['V',"ina","ika","ikd"])
# plt.ylabel('Potential (mV)')
# plt.xlabel('Time (ms)')



# plt.subplot(4,1,1)		
# plt.title(" Main Axon Membrane Potential")
# plt.subplot(3,1,1)		
# plt.plot(x,potential)	
# plt.ylim(-65,10)	
# plt.ylabel('Vm (mV)')
# plt.legend(["Parent Axon"])	
# plt.xlabel('Time (ms)')

# plt.subplot(4,1,2)
# plt.title("Primary Branch Membrane Potential")
plt.subplot(2,1,1)
plt.plot(x,va)	
plt.plot(x,vb)	
# plt.ylim(-65,10)	
# # plt.legend(["Primary Branch"])	
# plt.ylabel('Vm (mV)')
# plt.xlabel('Time (ms)')

# plt.subplot(4,1,3)
# plt.title("Membrane Potential")
plt.plot(x,vc)
plt.plot(x,vc2)		
plt.legend(["Main","Priamry","Secondary(s)", "Secondary(e)"])	
# plt.xlim(18700,19000)
# plt.ylim(-65,10)
# plt.legend(["Secondary Branch"])	
plt.ylabel('Vm (mV)')
plt.xlabel('Time (ms)')

# plt.subplot(4,1,4)
plt.subplot(2,1,2)
plt.plot(x,ana)	
plt.plot(x,bna)		
# plt.ylim(34,35.5)	
# plt.ylabel('Vm (mV)')
# plt.xlabel('Time (ms)')
# plt.subplot(5,1,5)
plt.plot(x,cna)	
plt.plot(x,cna2)
plt.legend(["Main","Priamry","Secondary(s)", "Secondary(e)"])	
# plt.ylim(34,35.5)
plt.ylabel('Na concentration')
plt.xlabel('Time (ms)')

# plt.subplot(3,1,3)
# plt.plot(x,na)	



plt.show()
