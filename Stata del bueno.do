*Resumen comandos

*************
*Utilitarios*
*************
*Instal Package
ssc install Nombre_Package
*Entrar a la carpeta
cd "/Users/katia/Desktop/Ayudantia Econometria/Ayudantia 1"  

*ver Ubicacion
pwd

*Ver directorio
dir

*Crear .log y desconectarce
log using log.smcl, replace
log close 

*Info comandos
help
help sum

*DATA
*Conectarce
use Casen2003.dta, clear 

*Ver variables
describe

*Ver y editar "vista excell"
browse
edit

*Limpiar base
clear

*Definir semilla
set seed 1984

/*
Operadores logicos
1.) == (indica igualdad)
2.) <
3.) >
4.) <= 
5.) >= 
6.) != (distinto, no)
7.) | (o)
8.) & (y)
*/


**********
*COMANDOS*
**********

*MANIPULAR*

*setear observaciones 
set obs 1000

*Generar Variables
gen RM=1 
gen RM=1 if r==13
gen Z=10+5*Y
gen X=runiform(a,b)  *Uniforme entre a y b
gen Y=rnormal(a,b)   *Normal media a y varianza b

egen newvar = fcn(arguments) [if] [in] [, options]
egen mean_residuos=mean(u_bancarias)
egen sum_o_2=total(o_2) if o_2!=. 


*Reemplazar variables
replace RM=0 
replace RM=0 if r~=13 & r!=. 
replace ytotef=ytotef/1000000

*Mantener datos en ram
keep nombres_variables  *Mantener columnas
keep if condición       *Mantener Filas
keep if X!=.


*descrtipcion variables

label data "descripccion"
label variable nombre_variable "descripcion"

*ANALIZAR*

*Tabular datos de una variable (frecuencias porcentajes)
tab edad 
tab edad if segmento==8405215 & o==10 & f==81
tab edad, mi   *Tabula tambien los Missing Values

*Info estadistica general
sum numper
sum numper, detail 
sum numper if f==81 & segmento==8405215

*Info Estadistica especifica (En stats)
tabstat u_bancarias, stats(mean min max sd) 

*Test de hipotesis
*media igual al numero
ttest X=0.4 
*ttest numerica, by(clasterisacion)  
ttest numper, by(RM)

*Tabla de Correlaciones 
corr X Y
corr X Y Z A B C

*regreciones: Explicar variable Y
reg Y X
reg Y A B C
reg Y A B C   if D==0


*Usar modelo entrenado 
predict Y, r    *Columna Reciduos
predict Y, xb   *Columna predicha



**********
*GRAFICAR*
**********
*Histograma
hist beta
twoway (hist beta) (hist check)    *Dos histogramas

*Nueve de puntos
scatter Y X 
scatter Y X if Z==0




*******
*Merge*
*******


**************
*Sintaxis FOR*
**************
forvalues n=100(100)1000{
clear
set obs `n' 
gen X=runiform()
gen Y=rnormal()
corr X Y
gen Z=10+5*Y
corr Z Y
corr Z X
}

forvalues i=1/5{
gen X_`i'=runiform()
gen e_`i'=rnormal()
gen Y_`i'=X_`i'+e_`i' 
reg Y_`i' X_`i'
di `i' 
}










