% Triangular impar, periodo 2L.
function y = triangular(x,h,L)
  % Lugar de x en periodo 2L.
  x = mod(x,2*L);
  esSubida1 = (x <= L/2);
  esSubida2 = (x >= 3*L/2);
  y = (2*h/L*x).*esSubida1 + (2*h/L*x - 4*h).*esSubida2 + (2*h - 2*h/L*x).*(1-esSubida1-esSubida2);
endfunction