clear;

% Para una simulacion sencilla.
c = 1;
topeX = pi;
pasoX = topeX/100;
T = (2*pi)/c;
pasoT = T/100;
x = [0:pasoX:topeX];

% Para pasar handler
f1 = estacionaria(@sin,c)
f2 = estacionaria(@(x) triangular(x,1,pi),c)
% Aproximacion de fourier de la triangular.
f3 = @(x) sum( 
for t = [0:pasoT:T]
  plot( x, f1(x,t),x,f2(x,t),"-" );
  axis([0,topeX,-1,1]);
  nombreImagen = sprintf("./output/%05d.png",t/pasoT);
  print("-dpng",nombreImagen);
endfor
