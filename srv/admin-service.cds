using db.gamespace as db from '../db/schema';

service AdminService {
    entity Games as projection on db.Games{
        title as Nome,
        company.name as Desenvolvedora,
        genre as Genero,
        typeOf as ModoDeJogo,
        price.amount as Valor,
        price.currency as Moeda,
        review as Nota
    };

    entity GamesAgreggate as projection on db.GamesAgreggate;

    entity Companies as projection on db.Companies{
        name as Nome,
        publCountry.code as teste,
        cnpj as CNPJ,
        city as Cidade
    };
}