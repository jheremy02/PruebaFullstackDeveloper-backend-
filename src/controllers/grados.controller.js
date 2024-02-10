const pool = require("../../db")
const boom = require("@hapi/boom")

const GradosService=require('../services/grados')

const serviceGrados=new GradosService() ;


const getGrados = async (req, res, next) => {

    try {
        
        const result = await serviceGrados.getGrados()
        res.json({ data: result, success: true })

    } catch (error) {

        next(error)

    }

}

module.exports={
    getGrados
}