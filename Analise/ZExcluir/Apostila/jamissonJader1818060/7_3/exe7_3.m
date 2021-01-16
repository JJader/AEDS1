close all

h = (4 -(-2))/(121 - 1);
x = -2:h:4;

for i = 1:size(x,2)
  if x(i) <=0
    y(i) = exp(x(i));
  else
    y(i) = x(i)*sin(5*x(i)) + 1;
  endif
endfor

splines(x,y);
