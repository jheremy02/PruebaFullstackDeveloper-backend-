const pool = require("../../db")
const boom = require("@hapi/boom")
const MovimientoService = require("../services/movimientos");
const CronogramaService = require("../services/cronogramas");

const movimientoService=new MovimientoService() ;
const cronogramaService=new CronogramaService()
const createMovimiento=async (req, res, next) => {
    const connection=await pool.getConnection()
    try {
        const {tipo_movimiento,monto,estado,fecha_pago,id_persona,id_detalle_cronograma}=req.body
        movimientoService.setConnection(connection) ;
        const cronogramas=await cronogramaService.getDetalleCronograma() ;

        cronogramas.forEach(async (item)=>{
            if (item.desc_pension==='matricula') {
                const {monto,}=item
                const result=await movimientoService.createMovimiento({tipo_movimiento,monto,estado:'PAGADO',fecha_pago,id_persona,id_detalle_cronograma}) ;

            }
        })

       

        await connection.commit()
        res.json({ data: { id: result.insertId, tipo_movimiento,monto,estado,fecha_pago,id_persona,id_detalle_cronograma }, success: true }) ;
    } catch (error) {
        await connection.rollback();
        next(error)
    }
}

module.exports={createMovimiento}