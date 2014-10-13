clear;

% Para una simulacion sencilla.
L = pi;
h = 1;
c = 1;
pasoX = L/100;
T = (2*pi)/c;
pasoT = T/100;
x = [0:pasoX:L];

% Para pasar handler
f1 = estacionaria(@sin,c)
f2 = estacionaria(@(x) triangular(x,h,pi),c)
% Aproximacion de fourier de la triangular.
n = [0:10]';
f3 = @(x,t) 8*h/(pi^2)*sum((-1).^n ./ ((2.*n + 1).^2) .* sin(pi/L.*(2.*n + 1)*x) .* cos(pi/L.*(2.*n + 1).*c.*t));
for t = [0:pasoT:T]
  plot( x, f1(x,t),x,f2(x,t),x,f3(x,t),"-");
  axis([0,L,-1,1]);
  legend("senoidal","triangular", "triangular aproximada");
  nombreImagen = sprintf("./output/%05d.png",t/pasoT);
  print("-dpng",nombreImagen);
endfor
