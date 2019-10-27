import numpy as np # python -m pip install --user numpy
import matplotlib.pyplot as plt # python -m pip install -U matplotlib
import os
os.system("cls")


def fconv(x1,x2):
    n1 = len(x1)
    n2 = len(x2)
    n = 0
    k = 0
    s = 0
    z = np.zeros(n1+n2-1)
    while n < (n1 + n2 - 1):
        k = 0        
        while (k < n1):
            if ((n - k) > -1) & (n - k < n2):
                s = s + x1[k] * x2[n - k]
            k = k + 1
        z[n] = s
        s = 0
        n = n + 1
    return z


N1 = 4
N2 = 3
x1 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,] # Primeiro Sinal
x2 = []
for i in range(-len(x1), -1 ):
    x2.insert(-1,(3)**i)

z = fconv(x1,x2) # Convolução
print(z)
n = np.arange(0,1,1) #Intervalo da convolução (PontoInicial, PontoFinal, 1++)
print(x2)

f, (ax1) = plt.subplots(1)

if len(n)<2:
    ax1.plot(z, 'bs') 
else:
    ax1.plot(n,z, 'bs')

ax1.set_title('Resposta ao degrau') 
ax1.grid()
plt.show()