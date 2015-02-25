
def fct(f, g, p, l):
    return map(lambda x: f(g(x)),
          [x for x in l if p(x)])

def f(x) :
  return int(x)+1

def g(x) :
  return str(x)

def p(x) :
  if x>2 :
    return True
  else :
    return False


l = [1,2,4,5]
solution = fct(f,g,p,l)
print solution


