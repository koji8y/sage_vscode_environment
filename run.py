# %%
# from sage.all import *
from sage.all import var, solve_ineq
# %%
x, y = var('x,y')
# %%
expr1 = 2 * x + 3 * y - 30 > 0
expr2 = 3 * x + 4 * y - 48 < 0 
# %%
try: 
  display()
except NameError:
  def display(*args, **kwargs):
    print(*args, **kwargs)
# %%
solution = solve_ineq([expr1, expr2])
display(solution)
# %%
