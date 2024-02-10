const express=require('express')

const {getGrados}=require('../../controllers/grados.controller')

const router= express.Router()

router.get('/',getGrados)


module.exports=router