import numpy as np

def ks_loop(x, alpha, D):
  if D < 1:
    raise RuntimeError("D must be greater or equal to 1")

  M = x.size
  size_y = D*M

  y = np.zeros(size_y)
  y[0:M] = x

  for i in range(M,size_y):
    y[i] = alpha * y[i-M]
  
  return y

x = np.random.randn(100)
y = ks_loop(x, 0.9, 10)

print y





    
