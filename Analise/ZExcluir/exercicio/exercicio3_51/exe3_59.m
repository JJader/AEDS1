x = [0 0.5];
y = [0.5 0.69146];

a = [1 x(1); 1 x(2)];
b = y';
solu = a\b;

resp = (0.8 - solu(1))/solu(2)