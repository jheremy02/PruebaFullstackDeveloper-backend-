const pool = require("../../db");
const boom = require("@hapi/boom")



//servicios para obtener datos de la db respecto a personas

class PersonaService {
    constructor() {
        this.connection=null
    }

    async setConnection(connection) {
        this.connection=connection
    }


    async createPersona(newPersona) {
        try {
            const {nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci,foto_ruta}=newPersona
            await this.connection.beginTransaction();
            const [result]=await this.connection.query(`
                INSERT INTO persona (nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci,foto_ruta) VALUES (?,?,?,?,?,?)`,[nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci,foto_ruta])
                await this.connection.commit()
                return result
        } catch (error) {
            await this.connection.rollback();
            throw error;
        }
    }

    async getPersonas () {
        try {
            const [result] = await this.connection.query('SELECT * FROM persona INNER JOIN grado on grado.nid_grado=persona.nid_grado',[])
            return result
        } catch (error) {
            throw error
        }
    }

    async getPersona(idPersona) {
        try {
            const [result] = await this.connection.query('SELECT * FROM persona INNER JOIN grado on grado.nid_grado=persona.nid_grado WHERE persona.nid_persona=?',[idPersona])
            if (result.length<=0) {
                throw new Error('Estudiante no encontrado')
            }
            return result[0]
        } catch (error) {
            throw error
        }
    }

    async deletePersona(idPersona){
        try {
            const [rows] = await pool.query('DELETE  FROM persona WHERE nid_persona=?', [idPersona])
            if (rows.affectedRows <= 0) {
                throw boom.notFound('Persona Not found')
            }
            return rows
        } catch (error) {
            throw error
        }
    }


}

module.exports=PersonaService