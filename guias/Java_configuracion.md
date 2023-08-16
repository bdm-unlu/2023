# Instalación y configuración de Java Development Kit (JDK)

A continuación se explica el paso a paso de la instalación de JDK, de acuerdo al Sistema Operativo que utilice.

### Sistemas Unix

1. Instalar el openjdk 8 (la última versión es la 11, pero no está soportada por Pentaho):
```sudo apt-get install openjdk-8-jdk```

### Sistemas Windows

1. En Windows, descargamos el instalador desde la web de Oracle en http://www.oracle.com/technetwork/java/index.html.
2. Una vez descargados e instalados, debemos configurar la variable de entorno __JAVA_HOME__ (Verificar el path donde se instaló JDK en esa máquina):
    - Hacemos click derecho sobre _“Mi PC”_ ó _“Este equipo”_, de acuerdo a la versión del SO, y seleccionamos la opción _“Propiedades”_. Luego accedemos a __“Configuración avanzada / Cambiar configuración -> Opciones avanzadas -> Variables de entorno -> Nueva (Variables del sistema)”__.
    - Configuramos la variable __JAVA_HOME__. Para ello, escribimos en el cuadro de texto lo siguiente:
          - __Nombre de variable__: JAVA_HOME,
          - __Valor de variable__: ruta en que se haya instalado Java. Por ejemplo “C:\Program Files\Java\jdk1.7.0_51”.
        


