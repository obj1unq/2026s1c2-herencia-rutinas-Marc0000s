import rutinas.* 

class Persona { 

    method tiempo()
    method peso()
    method kilosPorCaloria()
    method pesoAlRealizar(rutina)
    method pesoQuePierde(rutina){
        return (rutina.caloriasBajadas(self.tiempo())/ self.kilosPorCaloria())

    }

    method comprobarRutina(rutina){
        if(not self.puedeRealizarla(rutina)){
            self.error("La persona no puede realizar la rutina")
        }
    }
    method puedeRealizarla(rutina)
}

class PersonaSedentaria inherits Persona { 

    const property tiempo
    var property peso 
    const property kilosPorCaloria = 7000

    override method pesoAlRealizarla(rutina){
        self.comprobarRutina(rutina)
        peso = (peso - self.pesoQuePierde(rutina)).truncate(3)
    }

    override method puedeRealizarla(rutina){ 
        return peso > 50 
    }  
}

class PersonaAtleta inherits Persona { 

    const property tiempo = 90 
    var property peso = 0 
    const property kilosPorCaloria = 8000

    override method pesoQuePierde(rutina){
        self.comprobarRutina(rutina)
        peso = (peso - self.pesoQuePierde(rutina))
    }
    override method puedeRealizarla(rutina){
        return rutina.caloriasBajadas(self.tiempo() > 10000)
    }   
}
