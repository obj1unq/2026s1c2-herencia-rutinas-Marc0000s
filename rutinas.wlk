class Rutina { 

    method intensidad(){}
    method descanso(tiempo){}
    method caloriasBajadas(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }

}
class Running inherits Rutina { 

    var property intensidad = 0  

    override method descanso(tiempo){ 
        if(tiempo >= 20){
            return 5
        }
        else return 2
    }
}
class Maraton inherits Running { 

    override method caloriasBajadas(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad() * 2
    }
}
class Remo inherits Rutina {

    override method intensidad(){
        return 1.3
    }
    override method descanso(tiempo){ 
        return tiempo/5
    }
}
class RemoDeCompeticion inherits Remo { 

    override method intensidad(){
        return 1.7
    }
    override method descanso(tiempo){
        return 2.max((tiempo/5) - 3)
    }
} 