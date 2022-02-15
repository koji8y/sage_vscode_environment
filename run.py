# %%
# from sage.all import *
from sage.all import var, solve_ineq
# %%
x, y = var('x,y')
# %%
expr1 = 2 * x + 3 * y - 30 > 0
expr2 = 3 * x + 4 * y - 48 < 0 
# %%
solve_ineq([expr1, expr2])
# %%
