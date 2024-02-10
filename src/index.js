const express = require('express');
const routerApi = require('./routes/api/index.api');
const path = require('path');
const pool = require('../db');
const cors= require('cors');
const {PORT}=require('../config.js');
const { errorHandler,logErrors,boomErrorHandler } = require('./middlewares/error.handler.js');

const app = express();
const port = 3000;

app.use(express.json({limit:'50mb'}))
app.use(cors())

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

//enrutador
routerApi(app);

//middlware de tipo error van despues del routing
app.use(logErrors)
app.use(boomErrorHandler)
app.use(errorHandler)

app.use((req,res,next)=>{

    res.status(404).json({message:'endpoint not found',status:false});

 })

 app.listen(PORT, () => { console.log('Mi port' + port); });