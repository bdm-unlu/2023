# Guía de LABORATORIO: Introducción a la creación de reportes con Report Designer (Pentaho)

## Introducción a Report Designer
Report Designer es la herramienta de reporting de la Suite Pentaho y es utilizada para la creación de reportes ad hoc. Dado que la definición de la estructura del reporte se realiza de forma separada de la definición de los datos del contenido, tiene la ventaja con respecto a los reportes ad hoc tradicionales que cualquier modificación en el origen de datos será reflejada en el informe de forma automática. Podemos acceder a información mas detallada de la herramienta ingresando [acá.](https://help.pentaho.com/Documentation/8.1/Products/Report_Designer)

## Creación de Reportes con Report Designer
Para ingresar a Report Designer, debemos descomprimir la carpeta descargada desde el [Sitio Web](https://sourceforge.net/projects/pentaho/files/Report%20Designer/7.1/) y ejecutar el archivo report-designer (.sh en Ubuntu y .bat en Windows) luego de configurar la variable JAVA_HOME como se explica [aquí.](https://github.com/bdm-unlu/2021/blob/master/guias/Java_configuracion.md)

![Pantalla Report Designer](./imgs/rd-screen.png)

En la imagen se puede ver la distribución del home de la herramienta:
- A la izquierda, los diferentes componentes que podemos incorporar en nuestro reporte.
- En el centro, el paño en blanco que representa nuestro reporte y es donde vamos a incorporar los componentes y las definiciones.
- A la derecha podemos encontrar una columna con dos pestañas:
  - La primera, "Structure", donde podemos ver los componentes definidos para cada sección de nuestro reporte y definir todas las cuestiones inherentes al formato.
  - La segunda, "Data", donde vamos a definir los orígenes de datos desde los cuales vamos a consumir la información para los reportes.

__Ejemplo de la Guia:__ En esta guía vamos a graficar los conceptos desarrollando un reporte que liste y grafique (por especialidad) todos los medios de la provincia de Santa Cruz.

## Estructura de un Reporte
Los reportes en general, y en Report Designer en particular, tienen las siguientes secciones:

![Report Designer Estructura](./imgs/rd-structure.png)

Las secciones se explican a continuación:
- __Page Header & Footer:__ Estas dos secciones representan los típicos encabezados y pies de páginas y suelen no modificarse a lo largo de un informe. En general, se utilizan para incorporar los logos institucionales, nombres de las áreas, números de páginas, fecha, etc.
- __Report Header, Details & Footer:__ Estas tres secciones son utilizadas para organizar los elementos de cada reporte. En general, el encabezado es utilizado para explicar la misión del reporte con un título y una breve explicación, mientras que en details puede observarse información desagregada, generalmente a partir de una tabla o detalle a la vez que en el pie del reporte generalmente se presenta algún gráfico que pueda sintetizar esa información o complementarla.

## Paso 1: Configurando los datasources de nuestro Reporte
Para configurar los datasources que serán consumidos para armar el reporte, debemos presionar el botón derecho sobre el ícono "Data Sets" de la pestaña Data (derecha de la pantalla).

![Report Designer Data](./imgs/rd-data.png)

Luego, si por ejemplo deseamos conectarnos a una Base de datos relacional, el proceso será similar al que realizamos en CDE.

![Report Designer Datasource](./imgs/rd-datasource.png)

A continuación, vemos el editor del query SQL donde escribimos el query que recuperará la información que volcaremos en nuestro reporte; es importante hacer notar que cada componente espera la información de una manera distinta. 
Por un lado, para el listado de medios, vamos a seleccionar un conjunto de atributos de cada uno de los medios de la provincia de Santa Cruz:

![Report Designer query1](./imgs/rd-query1.png)

Por el otro, en el caso del gráfico de torta, que es el ejemplo que vamos a trabajar, el componente espera que le enviemos la información con una lista de etiquetas (leyenda de la barra) y un valor cuantitativo para cada etiqueta (alto de la barra).

![Report Designer query2](./imgs/rd-query2.png)

## Paso 2: Creando los labels del Reporte
Una vez configurados los orígenes de datos, vamos a avanzar en la renderización de nuestro reporte. Para ello, podemos insertar imágenes y labels como en casi cualquier otro editor de textos/reportes:

![Report Designer query2](./imgs/rd-labels.png)

## Paso 3: Creación de componentes
Ahora, vamos a crear los componentes de nuestro reporte. Es importante hacer notar que si nuestro reporte va a tener mas de un componente, vamos a tener que asignar subreportes, uno por cada componente, dado que estos se configuran de manera individual en cada caso.

Para la creación de subreports, debemos arrastrar el componente hacia el paño del reporte. Una vez que hagamos esto, vamos a manejar cada subreport como un reporte separado.

Por ejemplo, si queremos crear nuestro reporte con el listado de medios de Santa Cruz debemos tomar los atributos del query generados antes y arrastrarlos hasta la sección "Details", del subreport creado antes. A su vez, definimos los encabezados del listado, en la sección "Report Header":

![Report Designer Details](./imgs/rd-details.png)

Por otro lado, creamos otro subreport para el gráfico que muestre la cantidad de medios por especialidad en un gráfico de barras. Luego, volcamos el componente dentro del subreport en la sección "Report Footer":

![Report Designer Graph](./imgs/rd-graph.png)

Luego, como se ve en el gráfico, haciendo doble click en el componente vamos a configurar cual es el atributo que se asigna a la etiqueta y cual atributo se asigna como cantidad.

Una vez que finalizamos el diseño de nuestro reporte podremos pre-visualizarlo o exportarlo a varios de los formatos mas conocidos como html, pdf, ods, etc...

![Report Designer Preview](./imgs/rd-preview1.png)

Hasta aquí un breve instructivo con la utilización de Report Designer de Pentaho.
