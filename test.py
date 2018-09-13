# -*- coding: utf-8 -*-
"""
Spyder Editor

Este é um arquivo de script temporário.
"""

from sympy import *
x, a = symbols('x a')

f = Lambda((x,a), a*x - x*log(x))
fd = Lambda((x,a), diff(f(x,a), x))
prec = 6

print(f(x,a))
print(fd(x,a))


inicio = 2
ajustes = [-50, -1, 0, 0.69315218, 1, 1.9065, 2, 3, 4, 5]
tol = 10**-4

for ajuste in ajustes:
    print('#####################')
    found = False
    
    if abs(f(inicio, ajuste)) < tol:
        print('d', inicio)
        print('k',0)
        continue
    
    x0 = inicio
    for i in range(50):
        f_x0 =  f(x0, ajuste).evalf(prec)
        fd_x0 = fd(x0, ajuste).evalf(prec)
        #print(1,f_x0)
        #print(2,fd_x0)
    
        x1 = (x0 - ( f_x0 / fd_x0 )).evalf(prec)
        #print(3,x1)
        
        f_x1 =  f(x1, ajuste).evalf(prec)
        #print(4,f_x1)
    
        #print(5,abs(x1 - x0))
        if (abs(x1 - x0) <= tol):
          print('d', x1)
          print('k',i+1)
          found = True
          break
        x0 = x1
    
    if found:
        continue
    
    print('limite atingido sem resultado!')
    
