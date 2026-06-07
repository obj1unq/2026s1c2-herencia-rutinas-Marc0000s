import rutinas.*
import personas.*

class Club { 

    const predios 

    method mejorPredio(persona){ 
        return predios.max({predio => predio.totalCalorias(persona)})
    }
    
    method predioTranqui(persona){
        return predios.filter({predio => predio.esTranquilo(persona)})
    }

    method rutinasExigentes(persona){
        return predios.max({predio => predio.esExigente(persona)})

    }
}

class Predio { 
    const rutinas 

    method totalCalorias(persona){
        return rutinas.sum({rutina => rutina.caloriasBajadas(persona.tiempo())})
    }

    method esTranqui(persona){
        return rutinas.any({rutina => rutina.caloriasBajadas(persona.tiempo() < 500)})
    }

    method rutinaExigente(persona){
        return rutinas.max({rutina => rutina.caloriasBajadas(persona.tiempo())})
    }


}