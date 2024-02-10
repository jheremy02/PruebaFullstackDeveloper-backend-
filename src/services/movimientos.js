const pool = require("../../db");

class MovimientoService {
    constructor(){

        this.connection=null

    }

    setConnection(connection) {
        this.connection=connection
    }

    async createMovimiento (newMovimiento) {
        try {
            await this.connection.beginTransaction();
            const {tipo_movimiento,monto,estado,fecha_pago,id_persona,id_detalle_cronograma}=newMovimiento
            const [result]=await this.connection.query(`INSE INTO movimiento (tipo_movimiento,monto,estado,fecha_pago,id_persona,id_detalle_cronograma) VALUES (?,?,?,?,?,?)`,[tipo_movimiento,monto,estado,fecha_pago,id_persona,id_detalle_cronograma])
            await this.connection.commit()
            return result
        } catch (error) {
            await this.connection.rollback();
            throw error;
        }
    }

}

module.exports=MovimientoService