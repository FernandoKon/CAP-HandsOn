using {
  cuid,
  managed,
  Currency,
  Country
} from '@sap/cds/common';

namespace db.gamespace;

entity Games : cuid, managed {
  title   : String(255)    @title: 'Titulo'  @mandatory;
  company : Association to one Companies     @mandatory  @assert.target;
  genre   : Genre          @title: 'Genero'  @assert.range: true;
  typeOf  : typeOfGameplay @title: 'Modo de Jogo';
  price   : Price;
  review  : Review         @title: 'Nota';
}


entity Companies : cuid, managed {
  companyName : String(255)  @title: 'Empresa'  @mandatory;
  publCountry : Country      @title: 'Código do País';
  cnpj        : String(255)  @title: 'CNPJ';
  city        : String(255)  @title: 'Cidade';
  games       : Association to many Games
                  on games.company = $self
}

type Price {
  amount   : Decimal(10,2)  @title: 'Valor';
  currency : Currency @title: 'Moeda'
}

type typeOfGameplay : Integer enum {
  singleplayer = 1;
  multiplayer  = 2;
}

type Genre          : Integer enum {
  MMO          = 1;
  ESPORT       = 2;
  RPG          = 3;
  RTS          = 4;
  MOBA         = 5;
  BattleRoayle = 6;
}

type Review         : Integer enum {
  Péssima      = 1;
  Ruim         = 2;
  Média        = 3;
  Bom          = 4;
  Excelente    = 5;
}