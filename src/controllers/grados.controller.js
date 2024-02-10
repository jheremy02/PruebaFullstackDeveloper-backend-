const pool = require("../../db")
const boom = require("@hapi/boom")

const GradosService=require('../services/grados')

const serviceGrados=new GradosService() ;


//controlador para obtener el listado de grados
const getGrados = async (req, res, next) => {

    try {
        
        //solitamos los datos a la db mediante un servicio
        const result = await serviceGrados.getGrados()
        res.json({ data: result, success: true })

    } catch (error) {

        next(error)

    }

}

module.exports={
    getGrados
}