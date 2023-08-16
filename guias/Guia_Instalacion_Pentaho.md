# Guía de Instalación de la Suite Pentaho (SO Linux y Windows)

Pentaho BI Suite es un conjunto de aplicaciones libres para generar inteligencia empresarial (Business Intelligence) que emplearemos durante la materia. Utilizaremos la versión community, bajo licencia GPL.

## Instalación paso a paso:
1. La Suite Pentaho corre sobre la plataforma Java por lo tanto nos debemos asegurar de tener instalado Java Development Kit (JDK) y Java Runtime Environment (JRE). JDK incluye JRE y herramientas adicionales para el desarrollo de applets y aplicaciones. En el caso de no tener instalado el JDK se recomienda verificar como hacerlo en [esta guía](https://github.com/bdm-unlu/2021/blob/master/guias/Java_configuracion.md).
2. Una vez que tenemos instalado JAVA y configuradas las variables de entorno, debemos ingresar a la sección de downloads del sitio web de Pentaho community a efectos de descargar el software: https://community.hitachivantara.com/. Pentaho es multiplataforma, con lo cual no tendremos que distinguir por Sistema Operativo al momento de realizar la descarga de los instaladores.
3. Una vez en el sitio web, descargaremos las siguientes herramientas:
   - Business Analytics Platform,
   - Data Integration: también conocida como Kettle,
   - Schema Workbench.: también conocida como Mondrian.

### Instalación de Business Analytics Platform (Pentaho Server):
1. Descomprimimos el archivo __pentaho-server-ce-X.X.X.X-XXX.zip__.
2. A continuación, aparecerá la carpeta _pentaho-server_.
3. En este momento podríamos iniciar Pentaho ejecutando el archivo start-pentaho.sh (UNIX) o start-pentaho.bat (Windows) y accederlo a través de un navegador mediante la URL: [localhost:8080/pentaho/](http://localhost:8080/pentaho/). En el caso de ambientes UNIX debemos cautelar que el archivo tenga permisos de ejecución para el usuario.
4. No obstante, se podría modificar el puerto mediante 8080 por otro, por ejemplo el 9999. Esto se realiza editando el archivo __server.xml__.
5. La posición relativa del archivo __server.xml__ se encuentra en _/pentaho-server/tomcat/conf_. Debemos abrir el archivo, en caso de UNIX con un usuario con permisos de escritura, y modificamos el puerto en la línea:<br />
```<Connector URIEncoding="UTF-8" port="9999" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" />```.
6. Solo falta instalar uno de los Exploradores OLAP que provee Pentaho, en nuestro caso utilizaremos Saiku:
   - Para ello, descargamos el plugin del Marketplace de Pentaho en https://www.pentaho.com/marketplace/.
   - Luego, descomprimimos la carpeta dentro de la instalación de Pentaho en _/pentaho-server/pentaho-solutions/system/_.
   - Por último, tendremos que gestionar una licencia educativa en la web del desarrollador de Saiku, en http://licensing.meteorite.bi/, la descargamos,  renombramos como license.lic y por último la dejamos en el raíz de Saiku en _/pentaho-server/pentaho-solutions/system/Saiku_.

### Instalación de Schema Workbench (Mondrian):
1. Descomprimimos el archivo __psw-ce-X.X.X.X-XXX.zip__.
2. A continuación, aparecerá la carpeta _schema-workbench_.
3. Para ejecutar el software, ejecutamos el archivo __workbench.sh__ (UNIX) o __workbench.bat__ (Windows) que se encuentra en la carpeta raíz. En el caso de ambientes UNIX debemos cautelar que el archivo tenga permisos de ejecución para el usuario.
4. En la cursada, vamos a trabajar con Mondrian interactuando con el SGBD PostgreSQL, para ello debemos descargar el driver del conector JDBC de la web de PostgreSQL, en https://jdbc.postgresql.org/, y guardarlo en la carpeta _/schema-workbench/drivers/_.

### Instalación de Pentaho Data Integration (PDI o Kettle):
1. Descomprimimos el archivo __pdi-ce-X.X.X.X-XXX.zip__.
2. A continuación, aparecerá la carpeta _data-integration_.
3. Para iniciar PDI, ejecutamos el archivo __Spoon.sh__ (UNIX) o __Spoon.bat__ (Windows) que se encuentra en la carpeta raíz. En el caso de ambientes UNIX debemos cautelar que el archivo tenga permisos de ejecución para el usuario.
