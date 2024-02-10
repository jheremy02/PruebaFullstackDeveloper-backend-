const pool = require("../../db")
const boom = require("@hapi/boom")
const CronogramaService = require("../services/cronogramas");
const PersonService=require('../services/personas');
const MovimientoService = require("../services/movimientos");
const { getCurrentDate, saveFile64OnDisk } = require("../utils/toolsFunctions");

const personaService=new PersonService()
const cronogramaService=new CronogramaService()
const movimientoService=new MovimientoService()


const createPersona = async (req, res, next) => {
    const connection = await pool.getConnection();
    try {
        movimientoService.setConnection(connection);
        personaService.setConnection(connection);
        await connection.beginTransaction();

        const { nom_persona, ape_pate_pers, ape_mate_pers, nid_grado, fecha_naci, photo,name_photo } = req.body;
        const cronogramas = await cronogramaService.getDetalleCronograma(nid_grado);
        if (cronogramas.length<=0) {
            throw new Error('Cronogramas no encontrados')
        }
        
        const currentDate = getCurrentDate();
        fileSaved=null
        if (photo &&name_photo) {
            fileSaved=await saveFile64OnDisk(photo,name_photo)
        }
        
        try {

            const personCreated = await personaService.createPersona({ nom_persona, ape_pate_pers, ape_mate_pers, nid_grado, fecha_naci, foto_ruta:fileSaved });

            await Promise.all(cronogramas.map(async (item) => {
                if (item.desc_pension.trim() === 'matricula') {
                    const { monto, id_detalle_cronograma } = item;
                    await movimientoService.createMovimiento({ tipo_movimiento: 'INGRESO', monto, estado: 'PAGADO', fecha_pago: currentDate, id_persona: personCreated.insertId, id_detalle_cronograma });
                } else {
                    const { monto, id_detalle_cronograma } = item;
                    await movimientoService.createMovimiento({ tipo_movimiento: 'INGRESO', monto, estado: 'POR PAGAR', fecha_pago: null, id_persona: personCreated.insertId, id_detalle_cronograma });
                }
            }));

            const personaFound=await personaService.getPersona(personCreated.insertId)
            
            await connection.commit();
            res.json({ data: { ...personaFound }, success: true });
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }

    } catch (error) {
        await connection.rollback();
        next(error); 
    } finally {
        connection.release(); 
    }
};
  

const getPersonas=async (req, res, next)=>{
    const connection=await pool.getConnection()
    try {
        await personaService.setConnection(connection)
        const result=await personaService.getPersonas()
        res.json({ data: result, success: true })
    } catch (error) {
        next(error)
    }
}

const deletePersona=async(req, res, next)=>{
    const connection = await pool.getConnection();
    try {
        const {id}=req.params
        personaService.setConnection(connection);
        await connection.beginTransaction();
        const result=await personaService.deletePersona(id)
        await connection.commit();
        res.json({ message: 'deleted successfully', success: true , idPersona:id})
    } catch (error) {
        await connection.rollback();
        next(error)
    }
}

module.exports={
    createPersona,
    getPersonas,
    deletePersona
}