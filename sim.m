clear;
cd output

function y = triangular(x,h,L)
  % Hay que separar en Periodos de subida y de bajada. 
  x = mod(x,L);
  esSubida = (x <= L/2);
  y = (2*h/L*x).*esSubida + (2*h - 2*h/L*x).*(1-esSubida);
endfunction

function f = estacionaria(onda,c)
  f = @(x,t) 1/2*(onda(x + c*t) + onda(x - c*t));
endfunction

c = 1;
topeX = pi;
pasoX = topeX/100;
T = (2*pi)/c;
pasoT = T/100;
x = [0:pasoX:topeX];

% Para pasar handler
f1 = estacionaria(@sin,c)
f2 = estacionaria(@(x) triangular(x,1,pi),c)

for t = [0:pasoT:T]
  plot( x, f1(x,t),x,f2(x,t),"." );
  axis([0,topeX,-1,1]);
  nombreImagen = sprintf("%05d.png",t/pasoT);
  print("-dpng",nombreImagen);
endfor

cd ..