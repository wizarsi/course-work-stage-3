CREATE TABLE "football_leagues"
(
    "id"            SERIAL PRIMARY KEY,
    "name"          varchar(100) unique not null,
    "country"       varchar(100)        not null,
    "count_matches" int                 not null
);

CREATE TABLE "sport_directors"
(
    "id"            serial PRIMARY KEY,
    "name"          varchar(100) not null,
    "surname"       varchar(100) not null,
    "age"           int          not null,
    "football_club" int
);

CREATE TABLE "football_clubs"
(
    "id"             SERIAL PRIMARY KEY,
    "name"           varchar(100) unique not null,
    "coach"          int,
    "players_count"  int                 not null,
    "trophies_count" int                 not null,
    "budget"         int                 not null,
    "rating"         int                 not null,
    "sport_director" int                 not null
);


CREATE TABLE "players"
(
    "id"            serial PRIMARY KEY,
    "name"          varchar(100) not null,
    "surname"       varchar(100) not null,
    "age"           int          not null,
    "position"      varchar(100) not null,
    "statistic"     int          not null,
    "contract"      int,
    "rating"        int          not null,
    "football_club" int
);

CREATE TABLE "players_club"
(
    "player_id" int not null,
    "club_id"   int not null,
    PRIMARY KEY ("player_id", "club_id")
);

CREATE TABLE "coaches"
(
    "id"            serial PRIMARY KEY,
    "name"          varchar(100) not null,
    "surname"       varchar(100) not null,
    "age"           int          not null,
    "football_club" int          not null,
    "rating"        int          not null,
    "statistic"     int          not null
);

CREATE TABLE "coach_statistics"
(
    "id"             serial PRIMARY KEY,
    "won_mathes"     int not null,
    "count_matches"  int not null,
    "count_trophies" int not null
);

CREATE TABLE "player_statistics"
(
    "id"             serial PRIMARY KEY,
    "won_mathes"     int not null,
    "count_matches"  int not null,
    "count_trophies" int not null,
    "count_assists"  int not null,
    "count_goals"    int not null,
    "red_cards"      int not null
);

CREATE TABLE "coasts"
(
    "id"                 serial PRIMARY KEY,
    "currency_recipient" varchar(100) not null,
    "currency_sender"    varchar(100) not null,
    "exchange_rate_recipient_to_sender"      decimal      not null
);

CREATE TABLE "player_contracts"
(
    "id"                 serial PRIMARY KEY,
    "coast_id"           int  not null,
    "start_date"         date not null,
    "end_date"           date not null,
    "salary"             int  not null,
    "compensation_value" int  not null,
    "player_id"          int  not null
);

CREATE TABLE "transfer_request"
(
    "id"        serial PRIMARY KEY,
    "coast_id"  int not null,
    "club_from" int not null,
    "club_to"   int not null,
    "player_id" int not null
);

CREATE TABLE "exchange_request"
(
    "id"         serial PRIMARY KEY,
    "player_id"  int not null,
    "club_from"  int not null,
    "value"      int default 0,
    "player_get" int not null,
    "club_to"    int not null,
    "value_get"  int default 0
);

CREATE TABLE "club_league"
(
    "club_id"   int,
    "league_id" int,
    PRIMARY KEY ("club_id", "league_id")
);

ALTER TABLE "football_clubs"
    ADD FOREIGN KEY ("coach") REFERENCES "coaches" ("id");

ALTER TABLE "football_clubs"
    ADD FOREIGN KEY ("sport_director") REFERENCES "sport_directors" ("id");

ALTER TABLE "players"
    ADD FOREIGN KEY ("statistic") REFERENCES "player_statistics" ("id");

ALTER TABLE "players"
    ADD FOREIGN KEY ("contract") REFERENCES "player_contracts" ("id");

ALTER TABLE "players"
    ADD FOREIGN KEY ("football_club") REFERENCES "football_clubs" ("id");

ALTER TABLE "players_club"
    ADD FOREIGN KEY ("player_id") REFERENCES "players" ("id");

ALTER TABLE "players_club"
    ADD FOREIGN KEY ("club_id") REFERENCES "football_clubs" ("id");

ALTER TABLE "sport_directors"
    ADD FOREIGN KEY ("football_club") REFERENCES "football_clubs" ("id");

ALTER TABLE "coaches"
    ADD FOREIGN KEY ("football_club") REFERENCES "football_clubs" ("id");

ALTER TABLE "coaches"
    ADD FOREIGN KEY ("statistic") REFERENCES "coach_statistics" ("id");

ALTER TABLE "player_contracts"
    ADD FOREIGN KEY ("coast_id") REFERENCES "coasts" ("id");

ALTER TABLE "transfer_request"
    ADD FOREIGN KEY ("coast_id") REFERENCES "coasts" ("id");

ALTER TABLE "transfer_request"
    ADD FOREIGN KEY ("club_from") REFERENCES "football_clubs" ("id");

ALTER TABLE "transfer_request"
    ADD FOREIGN KEY ("club_to") REFERENCES "football_clubs" ("id");

ALTER TABLE "transfer_request"
    ADD FOREIGN KEY ("player_id") REFERENCES "players" ("id");

ALTER TABLE "exchange_request"
    ADD FOREIGN KEY ("player_id") REFERENCES "players" ("id");

ALTER TABLE "exchange_request"
    ADD FOREIGN KEY ("club_from") REFERENCES "football_clubs" ("id");

ALTER TABLE "exchange_request"
    ADD FOREIGN KEY ("player_get") REFERENCES "players" ("id");

ALTER TABLE "exchange_request"
    ADD FOREIGN KEY ("club_to") REFERENCES "football_clubs" ("id");

ALTER TABLE "club_league"
    ADD FOREIGN KEY ("club_id") REFERENCES "football_clubs" ("id");

ALTER TABLE "club_league"
    ADD FOREIGN KEY ("league_id") REFERENCES "football_leagues" ("id");

ALTER TABLE "player_contracts"
    ADD FOREIGN KEY ("player_id") REFERENCES "players" ("id");