clear;

aproxFourierTriangular(x,t)
% Para una simulacion sencilla.
h = 1;
c = 1;
topeX = pi;
pasoX = topeX/100;
T = (2*pi)/c;
pasoT = T/100;
x = [0:pasoX:topeX];

% Para pasar handler
f1 = estacionaria(@sin,c)
f2 = estacionaria(@(x) triangular(x,h,pi),c)
% Aproximacion de fourier de la triangular.
n = [0:100]';
f3 = @(x) sum(8*h/pi * (-1).^n ./ ((2*n + 1).^2) .* sin(pi/L*(2*n + 1)*x));
for t = [0:pasoT:T]
  plot( x, f1(x,t),x,f2(x,t),x,f3(x,t),"-");
  axis([0,topeX,-1,1]);
  legend("senoidal","triangular", "triangular aproximada"));
  nombreImagen = sprintf("./output/%05d.png",t/pasoT);
  print("-dpng",nombreImagen);
endfor
