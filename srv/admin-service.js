const cds = require('@sap/cds');
const { v4: uuidv4 } = require('uuid');

class AdminService extends cds.ApplicationService {
    init() {
        const { Games, Companies } = this.entities;
        
        this.after('READ', Companies, this.formatCNPJ);
        this.before(['CREATE', 'UPDATE'], Games, this.ensureCompanyID)
        return super.init();
    }

    ensureCompanyID(req) {
        const { company_ID } = req.data;
        console.log(company_ID)
        if (!company_ID) {
            try {
                const newUUID = uuidv4();
                cds.transaction(req).run(INSERT.into('Companies').entries({ID: newUUID}));
                company_ID = newUUID;
            } catch (error) {
                req.error("Erro ao criar uma nova empresa:", error);
            }
        }
    }

    formatCNPJ(data) {
        try {
            data.map(e => {
                if (e.cnpj) {
                    e.cnpj = e.cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, "$1.$2.$3/$4-$5");
                }
            });
        } catch (error) {
            console.error(error);
        }
    }
}

module.exports = AdminService;
