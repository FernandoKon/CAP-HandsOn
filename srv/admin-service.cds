using db.gamespace as db from '../db/schema';

service AdminService {
    entity Games as projection on db.Games{
        *
    } excluding {
        modifiedAt,
        modifiedBy,
        createdAt,
        createdBy,
    }; @cds.redirection.target

    entity GamesAggregate as projection on db.GamesAggregate {
        *
    } excluding {
        modifiedAt,
        modifiedBy,
        createdAt,
        createdBy,
    };

    entity Companies as projection on db.Companies{
        *
    } excluding {
        modifiedAt,
        modifiedBy,
        createdAt,
        createdBy,
        
    };
}