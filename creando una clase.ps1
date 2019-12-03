<#
definimos una clase
#>

$claseAlumno=@"
    using System;

    public class Alumno {
        // --------- propiedades ----------
        public String Nombre { get; set; }
        public String Apellidos { get; set; }
        public String NIF { get; set;}
        public int Edad { get; set; }
        public DateTime FechaNacimiento { get; set; }


        // ------- constructores ------------
        public Alumno() {}
        public Alumno(String n, String a){
            this.Nombre=n;
            this.Apellidos=a;
        }



        //----------- metodos ----------------
        public String Saluda(){
            return "hola, mi nombre es: " + this.Nombre + " y mi edad es " + System.Convert.ToString(this.Edad);
        } 

        public String Dudas(String materia){
            
            switch (materia){
                case "Sistemas": 
                    return "...mogollon....";

                case "Programacion":
                    return "...pues no se....";

                default:
                    return "...esa ni la conozco...";

            }
        
        
        }

       


    }

"@

Add-Type -TypeDefinition $claseAlumno -Language CSharp 

[Alumno]$yo=[Alumno]::new() # $yo=new Alumno()

$yo.Nombre="neo"
$yo.Apellidos="matrix"

write-host "el nombre del objeto YO es " $yo.Nombre

$yo.Saluda() #asi ejecutas el metodo .Saluda()
$yo.Dudas("Sistemas");