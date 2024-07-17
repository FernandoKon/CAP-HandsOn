const cds = require('@sap/cds')

class AdminService extends cds.ApplicationService {
    init() {
        this.readCompanies();

        return super.init();
    }

    readCompanies() {
        const { Companies } = this.entities;

        this.after('READ', Companies, (each) => {
            if (each.cnpj) {
                each.cnpj = this.formatCNPJ(each.cnpj);
            }
        });
    }

    formatCNPJ(cnpj) {
        return cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, "$1.$2.$3/$4-$5");
    }
    
}

module.exports = AdminService;