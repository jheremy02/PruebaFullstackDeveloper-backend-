const boom = require("@hapi/boom")


//validador donde le paso el schema y la propiedad de donde debe sacarlos para revisar
//si cumpleman el esquema de datos
 function validatorHandler(schema,property) {
    return async function (req,res,next) {
        
        const data=req[property]
        const {error}=schema.validate({...data})

        if (error) {
            next(boom.badRequest(error))
        } else {
            next()
        }
    }
}

module.exports={validatorHandler}