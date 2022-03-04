import csv
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as colors
from matplotlib.colors import ListedColormap

data = np.loadtxt("Fig5coutput2.dat")
# data2 = np.loadtxt("Diameter2.dat")

# data=np.log10(data)
#data = -data

numrows = len(data)
numcols = len(data[0])
data_new = []

line = 0
row = -1

for qg in range(4):

	for qpump in range(4):

		data_new.append([])
		row += 1

		for qm in range(4):

			for qh in range(4):

				for i in range(6):

					result = int(data[line][0])
						
					if result<3 and data[line][result+1] > 400:
						data_new[row].append(3)
					else:
						data_new[row].append(result)
					line += 1



# x = np.arange(16)
# y = np.arange(5,23,1.5)
# levels = MaxNLocator(nbins=15).tick_values(data.min(), data.max())
# norm = BoundaryNorm(levels, ncolors=cmap.N, clip=True)

fig, ax = plt.subplots()
# c=ax.pcolormesh(data_new)
cMap = ListedColormap(['purple', 'green', 'lightblue','yellow']) 
c=ax.pcolormesh(data_new,cmap=cMap)
# c=ax.pcolormesh( y,x, data,norm=colors.LogNorm(vmin=data.min(), vmax=data.max()))
cbar = plt.colorbar(c,ticks = np.linspace(0,0,0))
for j, lab in enumerate(['$3$','$2$','$1$','$0$']):
    cbar.ax.text(10, (j)/1.3, lab, ha='center', va='center')#( 2*j + 1) / 8.0
cbar.ax.get_yaxis().labelpad = 15


plt.title("Parameter Space for Sucessful AP Propagation")
plt.xlabel('Q10 of Sodium activation and inactivation rate') 
plt.ylabel('Q10 of sodium channel conductance and pump conductance')
plt.show()


