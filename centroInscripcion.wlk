import elAlambiqueViajero.*
object centroDeInscripcion {
    const property inscriptos = []

    const property rechazados = []

    var ciudadDeLaCarrera = buenosAires

    method inscribirAuto_(unAuto) {
        if (ciudadDeLaCarrera.puedeLlegar(unAuto)) {
            inscriptos.add(unAuto)
        } 
        else {
            rechazados.add(unAuto)
        }
    }

    method cambiarCiudadDeLaCarrera(nuevaCiudad) {
        ciudadDeLaCarrera = nuevaCiudad
        self.reevaluarInscriptosYRechazados()
    }

    method reevaluarInscriptosYRechazados() {
        const listaAReevaluar = inscriptos + rechazados
        inscriptos.clear()
        rechazados.clear()
        listaAReevaluar.forEach({auto => self.inscribirAuto_(auto)})
    }

    method irALaCarrera() {
        inscriptos.forEach({auto => auto.desgaste()})
    }

    method ganadorDeLaCarrera() {
        inscriptos.max({auto => auto.velocidad()})
    }

    method listaDelResultadoDeLaCarrera() = inscriptos.sortedBy({primerAuto, segundoAuto => primerAuto.velocidad() > segundoAuto.velocidad()})
}


