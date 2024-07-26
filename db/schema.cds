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
  typeOf  : Association to one TypeOf;
  price   : Price;
  genre   : Association to one Genre;
  review  : Review         @title: 'Avaliação';
}


entity Companies : cuid, managed {
  companyName : String(255)  @title: 'Desenvolvedora' ;
  publCountry : Country      @title: 'Código do País';
  cnpj        : String(255)  @title: 'CNPJ';
  city        : String(255)  @title: 'Cidade';
  games       : Association to many Games
                  on games.company = $self
}

entity Genre : cuid, managed {
  type  : String(255) @title : 'Gênero'; 
  value : Integer;
}

entity TypeOf : cuid, managed {
  type  : String(255) @title : 'Modo de Jogo'; 
  value : Integer;
}

type Price {
  amount   : Decimal(10,2)  @title: 'Preço';
  currency : Currency @title: 'Moeda'
}

type Review  : Integer enum {
  Péssima      = 1;
  Ruim         = 2;
  Média        = 3;
  Bom          = 4;
  Excelente    = 5;
}
