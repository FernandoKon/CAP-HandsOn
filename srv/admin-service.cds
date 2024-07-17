using db.gamespace as db from '../db/schema';

service AdminService {
    entity Games as projection on db.Games{
        *
    } excluding {
        modifiedAt,
        modifiedBy,
        createdAt,
        createdBy,
    };

    // entity GamesAgreggate as projection on db.GamesAgreggate;

    entity Companies as projection on db.Companies{
        *
    } excluding {
        modifiedAt,
        modifiedBy,
        createdAt,
        createdBy,
        
    };
}