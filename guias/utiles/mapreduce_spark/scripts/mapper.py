#!/usr/bin/env python
"""mapper.py"""

import sys

# Tomamos los input de la entrada estandar STDIN
for line in sys.stdin:
    # Se eliminan los espacios en blanco iniciales y finales
    line = line.strip()
    # Separo la linea en palabras
    words = line.split()
    # Incremento contadores
    for word in words:
        # Se escriben los resultados en STDOUT (salida estándar);
        # Lo que procese cada mapper será la entrada para el reducer.py
        # Lo pasamos delimitado por tabulaciones
        print(word, '\t', 1)
