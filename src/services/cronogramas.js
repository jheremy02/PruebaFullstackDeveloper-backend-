const pool = require("../../db");

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