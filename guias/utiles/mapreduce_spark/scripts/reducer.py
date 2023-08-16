#!/usr/bin/env python
"""reducer.py"""

import sys

current_word = None
current_count = 0
word = None

# Tomamos los input de la entrada estandar STDIN
for line in sys.stdin:
    # Eliminamos los espacios
    line = line.strip()

    # Parseamos la entrada del mapper.py
    word, count = line.split('\t', 1)

    # Convertmos el contador a un entero
    try:
        count = int(count)
    except ValueError:
        # En caso que el contador no sea un entero ignoramos la linea
        continue

    # este IF-switch solo funciona porque Hadoop ordena la salida del mapper por clave
    # (aquí la salida es word) antes de que se pase al reducer.py
    if current_word == word:
        current_count += count
    else:
        if current_word:
            # Escribimos el resultado a la salida estandar (STDOUT)
            print(current_word, '\t', current_count)
        current_count = count
        current_word = word

# Se envía la última palabra
if current_word == word:
    print(current_word, '\t', current_count)
