@ECHO OFF
echo Herramientas de importacion/exportacion de backups Oracle
SET ORACLE_PATH=C:\oraclexe\app\oracle\product\11.2.0\server\bin
SET archivo_sql=Scripts.sql
SET ip_servidor=
SET sid=

:menu
echo Opciones
echo 	1. Importar base de datos
echo 	2. Exportar base de datos
echo 	x. Salir

echo Ingrese una opcion (1-2/x)
SET/p op=

if %op%==x (
	goto fin
)


echo Ingrese el nombre del usuario
SET/p usuario=
echo Ingrese la contrasena
SET/p contrasena=
echo Ingrese el nombre del archivo
SET/p archivo=
echo Ingrese el autor del archivo (obligatorio para importar)
SET/p autor=
echo Ingrese la direccion del servidor (obligatorio para exportar)
SET/p ip_servidor=
echo Ingrese el nombre de la bd (SID) (obligatorio para exportar)
SET/p sid=

if %op%==1 (
	goto importar
)

if %op%==2 (
	goto exportar
) 
else (
	goto error
)


:importar
echo 	Importando archivo
%ORACLE_PATH%\IMP.exe %usuario%/%contrasena% file=%archivo% log=%archivo%.log fromuser=%autor% touser=%usuario% 
goto preguntarEjecutarSQL

:exportar
%ORACLE_PATH%\exp.exe %usuario%/%contrasena%@%ip_servidor%/%sid% STATISTICS=NONE file=%usuario%_%archivo%.DMP 
goto menu

:preguntarEjecutarSQL
echo Ejecutar sentencias SQL (s)
set/p ejeSQL= 
if %ejeSQL%==s (
	goto ejecutarSQL
)
else (
	goto menu
)


:ejecutarSQL
echo 	Ejecutando sentencias SQL
echo sqlplus.exe %usuario%/%contrasena% @%archivo_sql%
sqlplus.exe %usuario%/%contrasena% @%archivo_sql%
goto menu


:error
cls
echo No es una opcion valida
goto menu

:fin
pause
exit