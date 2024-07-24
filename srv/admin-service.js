const cds = require('@sap/cds')

class AdminService extends cds.ApplicationService {
    init() {
        // this.readCompanies();
        this.readGames();
        
        return super.init();
    }

    readCompanies() {
        const { Companies } = this.entities;

        this.after('READ', Companies, (e) => {
            if (e.cnpj) {
                e.cnpj = this.formatCNPJ(e.cnpj);
            }
        });
    }

    readGames() {
        const { Games } = this.entities;

        this.after('READ', Games, (e) => {
            console.log(e.title)
        })
    }

    formatCNPJ(cnpj) {
        return cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, "$1.$2.$3/$4-$5");
    }
    
}

module.exports = AdminService;