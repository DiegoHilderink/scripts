## Scripts

Author: Diego Hilderink Domínguez

**rama.sh**
Este script te permite generar un nuevo proyecto tipo DAW de php, html o js, creando plantillas de cada uno.

**1. Iniciar**
Para iniciar este script es tan sencillo como ejecutar el 'rama.sh' y agregar como segundo parámetro el nombre de un directorio.

Ejemplo:

     rama.sh prueba_1 
     
Esta escrito para que puedas iniciar un nuevo proyecto de git en la misma carpeta.

**2. Parametros que recibe**

Como primer parámetro recibe el nombre de un directorio. 

Si no es un directorio, el propio programa entenderá que buscas ayuda.

Si le pasas un nombre y existe te dará la opción de sobreescribirlo.

Si le pasas un nombre y el parametro `-r` te permitirá crear un nivel de subcarpetas, nombradas mediante numeros según la cantidad de carpetas internas que quieras.

Ejemplo:
 
    rama.sh prueba_1 -r 5
    
Esto generará 5 subcarpetas nombradas de 1 a 5.

Puedes añadir tus plantillas a /rTemplates y escribir una nueva línea de código en rama.sh en la línea 74 que lleve a esa plantilla.

*Este proyecto ha sido generado bajo licencia GNU*

*Versión dev-master*
