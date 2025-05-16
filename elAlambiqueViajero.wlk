object luke{
    var cantidadViajes = 0

    var recuerdo = null

    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes += 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo

    method vehiculo(nuevo) {vehiculo = nuevo}
}

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"

    method puedeLlegar(movil) =  movil.puedeFuncionar()
}

object buenosAires{
    var esTemporadaDeLluvias = false

    method recuerdoTipico() = if(esTemporadaDeLluvias) "Mate común" else "Mate con yerba"

    method puedeLlegar(auto) = auto.rapido() 

    method cambiaSiEsTemporadaDeLluvias() {
        esTemporadaDeLluvias = not esTemporadaDeLluvias
    }
}

object bagdad {
    var recuerdo = "bidon de petroleo"

    method recuerdoTipico() = recuerdo

    method cambiarRecuerdoPor_(nuevoRecuerdo) {
        recuerdo = nuevoRecuerdo
    }

    method puedeLlegar(cualquierCosa) = true
}

object lasVegas{
    var homenaje = paris

    method homenaje(lugar) {
        homenaje = lugar
    }

    method recuerdoTipico() = homenaje.recuerdoTipico()

    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object hurlingham {
    method puedeLlegar(vehiculo) = vehiculo.puedeFuncionar() and vehiculo.rapido() and vehiculo.patenteValida()

    method recuerdoTipico() = "Sticker de la UNaHur"
}

//Vehiculos
object alambiqueVeloz {
    var rapido = true

    var combustible = 20

    const consumoPorViaje = 10

    var patente = "AB123JK"

    method puedeFuncionar() = combustible >= consumoPorViaje

    method desgaste() {
        combustible = combustible - consumoPorViaje
    }

    method rapido() = rapido

    method patenteValida() = patente.take(1) == "A"

    method cambiarSiEsRapido() {
      rapido = not rapido
    }

    method cambiarPatente(nuevaPatente) {
      patente = nuevaPatente
    }

    method velocidad() = 100 + combustible
}

object antigualla {
    const property gangsters = ["Bam", "Bem", "Bim", "Bom", "Ricardo", "LocoMcLocomotor", "Secuaz"]

    method sumarGangster(gangster) {
        gangsters.add(gangster)
    }

    method bajarGangster(gangster) {
        gangsters.remove(gangster)
    }

    method puedeFuncionar() = gangsters.size().even()

    method rapido() = gangsters.size() > 6

    method desgaste() {
        self.bajarGangster(gangsters.first())
    }

    method patenteValida() = gangsters.contains("ricardo")

    method velocidad() = gangsters.fold("", {acum, gangster => acum + gangster}).size()
}
object chatarra {
    var cañones = 10

    var municiones = "ACME"

    method puedeFuncionar() = municiones == "ACME" and cañones.between(6, 12)

    method rapido() = municiones.size() < cañones

    method desgaste() {
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 ) {
          municiones = municiones + " Obsoleto"
        }
    }
    method patenteValida() = municiones.take(4) == "ACME" 

    method cañones() = cañones

    method velocidad() = 50 + cañones * 5
}

object convertible {
    var numeroDeVehiculoSiguiente = 1

    var convertido = alambiqueVeloz

    const listaDeVehiculosPosibles = [alambiqueVeloz, moto, superPerrari, chatarra, antigualla]

    method puedeFuncionar() = convertido.puedeFuncionar()

    method rapido() = convertido.rapido()

    method desgaste() {
        convertido.desgaste()
    }

    method convertir() {
        convertido = listaDeVehiculosPosibles.anyOne()
    }

    method convertirAlVehiculo_(unVehiculo) {
        convertido = unVehiculo
    }

    method convertirAlSiguiente() {
        convertido = listaDeVehiculosPosibles.get(numeroDeVehiculoSiguiente)
        numeroDeVehiculoSiguiente = if (numeroDeVehiculoSiguiente == listaDeVehiculosPosibles.size() - 1) 0 else numeroDeVehiculoSiguiente + 1
    }

    method patenteValida() = convertido.patenteValida()

    method velocidad() = convertido.velocidad() - 1
}

object moto {
    method rapido() = true

    method puedeFuncionar() = not self.rapido()

    method desgaste() {}

    method patenteValida() = false

    method velocidad() = 10
}

object superPerrari {
    var combustible = combustibleDeAvion

    var cantidadDeTrampas = 0

    method rapido() = combustible.esRapido()

    method puedeFuncionar() = cantidadDeTrampas < 10

    method desgaste() {
        self.realizarTrampa()
    }

    method patenteValida() = combustible.esRapido() or self.puedeFuncionar()

    method velocidad() = 1.max(500 - combustible.penalizacion() - cantidadDeTrampas * 250)

    method realizarTrampa() {
        combustible = combustible.siguienteCombustible()
        cantidadDeTrampas += 1
    }
}

//Combustibles
object combustibleDeAvion {
    method esRapido() = true

    method penalizacion() = 250

    method siguienteCombustible() = combustibleSaturado
}

object combustibleSaturado {
    method esRapido() = false

    method penalizacion() = 300

    method siguienteCombustible() = combustibleUltimate
}

object combustibleUltimate {
    method esRapido() = true

    method penalizacion() = 350

    method siguienteCombustible() = combustibleDeAvion
}

/*



*/
  
