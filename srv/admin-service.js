const cds = require('@sap/cds');
const { v4: uuidv4 } = require('uuid');

class AdminService extends cds.ApplicationService {
    init() {
        const { Games, Companies } = this.entities;
        
        this.after('READ', Companies, this.formatCNPJ);
        console.log(Games)
        this.before('CREATE', Games, req => {
            console.log("Dados:", req.data)
        })

        return super.init();
    }

    async ensureCompanyID(req) {
        console.log("PASSOU!")
        const { data } = req;
        if (!data.company_ID) {
            try {
                const newUUID = uuidv4();
                await cds.transaction(req).run(INSERT.into('Companies').entries({ ID: newUUID, name: 'Default Company' }));
                data.company_ID = newUUID;
            } catch (error) {
                console.error("Erro ao criar uma nova empresa e assegurar company_ID", error);
                req.error(400, 'Erro ao criar uma nova empresa e assegurar company_ID');
            }
        }
    }

    formatCNPJ(data) {
        try {
            if (Array.isArray(data)) {
                data.forEach(e => {
                    if (e.cnpj) {
                        e.cnpj = e.cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, "$1.$2.$3/$4-$5");
                    }
                });
            } else if (data.cnpj) {
                data.cnpj = data.cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, "$1.$2.$3/$4-$5");
            }
        } catch (error) {
            console.error(error);
        }
    }

    formatReview(data) {
        try {
            data.map(e => {
                let stars = '★'.repeat(e.review);
                e.review = stars;
            });
        } catch (error) {
            console.error(error);
        }
    }
}

module.exports = AdminService;
