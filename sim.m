clear;
cd output

c = 1;
topeX = pi;
pasoX = topeX/100;
T = (2*pi)/c;
pasoT = T/100;
x = [0:pasoX:topeX];
function y = s1(x,t,c)
  y = 0.5 * ( sin(x + c*t) + sin(x - c*t));
endfunction

% Para pasar handler
f = @(x,t) s1(x,t,c);

for t = [0:pasoT:T]
  print(f(x,t))
  plot( x, f(x,t) );
  axis([0,topeX,-1,1]);
  nombreImagen = sprintf("%05d.jpg",t/pasoT);
  print("-djpg",nombreImagen);
endfor

cd ..