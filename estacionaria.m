% Estacionaria muy rustica con la misma amplitud final.
function f = estacionaria(onda,c)
  f = @(x,t) 1/2*(onda(x + c*t) + onda(x - c*t));
endfunction