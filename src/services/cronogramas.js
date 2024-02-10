const pool = require("../../db");


//servicios para obtener datos de la db respecto a cronogramas

class CronogramaService {
    constructor () {

 }

 async getDetalleCronograma(id_grado) {

    try {
        
        const [result]=await pool.query('SELECT * FROM  detalle_cronograma where id_grado=?',[id_grado]);

        return result

    } catch (error) {
        
        throw error

    }
 }

}

module.exports=CronogramaService