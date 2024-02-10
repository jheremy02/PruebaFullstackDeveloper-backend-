const Joi = require("joi");

const nom_persona = Joi.string().max(40).message('Maximo 40 caracteres!');
const ape_pate_pers = Joi.string().max(40).message('Maximo 40 caracteres!');
const ape_mate_pers = Joi.string().max(40).message('Maximo 40 caracteres!');
const nid_grado = Joi.number() ;
const fecha_naci = Joi.string().pattern(new RegExp(/^\d{4}-\d{2}-\d{2}$/)).message('Formato de fecha invalido') ;


//schema de los datos para el create de un estudiante
const createPersonaSchema = Joi.object({
    nom_persona: nom_persona.required(),
    ape_pate_pers: ape_pate_pers.required(),
    ape_mate_pers: ape_mate_pers.required(),
    nid_grado: nid_grado.required(),
    fecha_naci: fecha_naci.required()
}).unknown(true)

module.exports={
    createPersonaSchema
}