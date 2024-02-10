const express=require('express')
const { createMovimiento } = require('../../controllers/movimientos.controller')

const router= express.Router()

router.post('/',createMovimiento)


module.exports=router