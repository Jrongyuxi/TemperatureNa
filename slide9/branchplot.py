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

for i in range(numrows):

	data_new.append([])

	for j in range(numcols):

		if j%2 == 0:

			data_new[i].append(data[i][j])

print(data_new)


x = np.arange(0,44,4)
y = np.arange(3.5,21.5,1.5)
# levels = MaxNLocator(nbins=15).tick_values(data.min(), data.max())
# norm = BoundaryNorm(levels, ncolors=cmap.N, clip=True)

fig, ax = plt.subplots()
# c=ax.pcolormesh( x,y, data_new)
cMap = ListedColormap(['purple', 'green', 'lightblue','yellow']) 
c=ax.pcolormesh( x,y, data_new,cmap=cMap)
# c=ax.pcolormesh( y,x, data,norm=colors.LogNorm(vmin=data.min(), vmax=data.max()))
cbar = plt.colorbar(c,ticks = np.linspace(0,0,0))
for j, lab in enumerate(['$3$','$2$','$1$','$0$']):
    cbar.ax.text(10, (j)/1.3, lab, ha='center', va='center')#( 2*j + 1) / 8.0
# cbar.ax.get_yaxis().labelpad = 15


plt.title("Parameter Space for Sucessful AP Propagation")
plt.xlabel('Temperature (Celsius)') 
plt.ylabel('Diameter (Micrometer)')
plt.show()


