const express=require('express')

const gradosApi=require('./grados.api') ;
const personasApi=require('./personas.api') ;
const movimientosApi=require('./movimientos.api')


function routerApi(app) {

    
    app.use('/api/grados' ,gradosApi)
    app.use('/api/personas',personasApi)
    app.use('/api/movimientos',movimientosApi)
    
}


module.exports=routerApi