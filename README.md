Simulaciones
============

Scripts de bash y octave para visualizar señales variables en el tiempo.

animar.sh: el único que debe ejecutarse. Se encarga de utilizar los otros. Basta con escribir en la línea de comandos "sh animar.sh" para ejecutar que se cree el video. Si ya se creado un video, pedirá permiso para sobreescribirlo.
sim.m: plotea las imágenes que van a ser fotogramas del video. Utiliza actualmente una aproximación en series de Fourier de grado 3 para comparar con la triangular verdadera.
triangular.m: señal triangular impar.
estacionaria.m: señal estacionaria en base a dos viajeras en sentido contrario.
