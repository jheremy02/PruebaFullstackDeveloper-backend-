const pool = require("../../db");

class GradoService {

    constructor() {

    }

    async getGrados() {
        try {
            const [result]=await pool.query('SELECT * FROM grado',[])
            return result
        } catch (error) {
            throw error
        }
    }

    async getGrado(idGrado){
        try {
            const [rows]=await pool.query('SELECT * FROM grado WHERE nid_grado=?',[idGrado])

            if (rows.length <= 0) {
                throw boom.notFound('User not found')
            }

            return rows[0]

        } catch (error) {
            throw error
        }
    }

}

module.exports=GradoService