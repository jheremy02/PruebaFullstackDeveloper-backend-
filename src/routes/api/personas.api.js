const express=require('express')
const {createPersona, getPersonas, deletePersona}=require('../../controllers/personas.controller');
const { createPersonaSchema } = require('../../schemas/persona.schema.');
const { validatorHandler } = require('../../middlewares/validator.handler');

const router= express.Router() ;

router.post('/',validatorHandler(createPersonaSchema,'body'),createPersona) ;
router.get('/',getPersonas) ;
router.delete('/:id',deletePersona)

module.exports=router