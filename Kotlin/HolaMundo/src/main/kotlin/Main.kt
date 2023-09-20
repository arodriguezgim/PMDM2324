fun main() {
    //println("Hola Mundo")

    // Esto es un comentario
    /*
    Aqui puedo comentar lo que quiera
     */

    // Variables
    var myString = "Esto es una cadena de texto"
    println(myString)
    //myString = 6 Error
    var myString2: String = "Otra cadena de texto"
    println(myString2)
    var myInt = 6
    myInt = myInt+4
    println(myInt)
    var myDouble = 4.5
    println(myDouble)
    var myBool = false
    println(myBool)

    // Constantes
    val myConst = "Mi propiedad constante"
    //myConst = "Esto es otra propiedad" Error

    //Control de flujo
    if ( myBool == false  ){
        println("myBool es false")
    } else {

    }

    // ESTRUCTURAS DE KOTLIN
    // Lista
    var myList = listOf<String>("Alberto","Rodriguez","Teruel")
    var myList2 = mutableListOf("Alberto","Rodriguez","Teruel")
    myList2.add("Alberto")
    println(myList2)
    // Sets
    var mySet = mutableSetOf("Alberto","Rodriguez","Teruel")
    mySet.add("Alberto")

    println(mySet)
    // Maps Permiten guardar propiedades del tipo clave valor
    var myMap = mutableMapOf("Alberto" to 23, "Rodriguez" to 65)
    println(myMap["Alberto"])

    //Bucles
    for ( value in myList){
        println(value)
    }

    for ( value in mySet){
        println(value)
    }
    for ( value in myMap){
        println(value)
    }







}