<#
5. hacer un script que lea un fichero en el que residen las cuentas de usuario que tienes que dar de alta. El fichero se llama
FICHERO_USUARIOS.TXT y cada una
de sus lineas representa la info de una cuenta, y tienen el siguiente formato:

	Nombre : Apellidos : NIF : Direccion : Localidad : Provincia : Tlfno : Departamento : Email

 Deberas crear cada una de las cuentas de esta forma:
		-el LOGIN sera el campo del Email, sustituyendo la @ por _
		-la PASSWORD de la cuenta sera el NIF, siempre y cuando tenga el formato de 8 numeros-Letra, si no tiene el formato bien, sera 00000000-Z y se
		 metera esa linea en un fichero llamado NIFS_ERRONEOS.TXT
		-se meteran como comentarios de la cuenta el NOMBRE,APELLIDOS,TLFNO,DIRECCION
		-las cuentas deben pertenecer a un grupo local llamado como el DEPARTAMENTO (si no existe dicho grupo debe crearse antes)
		-las cuentas se activaran en 15 dias.
   #>

 Clear-Host

