using {
    cuid,
    managed,
    Currency,
    Country,
    sap.common.CodeList
} from '@sap/cds/common';

namespace db.gamespace;

entity Games : cuid, managed {
    title   : String(255)               @mandatory;
    company : Association to Companies  @mandatory  @assert.target;
    genre   : Genre                     @assert.range: true;
    typeOf  : typeOfGameplay;
    price   : Price;
    review  : Review;
}

entity GamesAgreggate as projection on Games {
    title,
    genre,
    typeOf,
    price,
    review
}

entity Companies : cuid, managed {
    name        : String(255)           @mandatory;
    publCountry : Country;
    cnpj        : String(255);
    city        : String(255);
    games       : Association to many Games
                      on games.company = $self
}

type Price {
    amount   : Decimal;
    currency : Currency
}

type typeOfGameplay : Integer enum {
    singleplayer = 1;
    multiplayer  = 2;
}

type Genre : Integer enum {
    MMO          = 1;
    ESPORT       = 2;
    RPG          = 3;
    RTS          = 4;
    MOBA         = 5;
    BattleRoayle = 6;
}

type Review : Integer enum {
    bad          = 1;
    poor         = 2;
    average      = 3;
    good         = 4;
    excellent    = 5;
}
