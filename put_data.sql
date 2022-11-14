

insert into football_leagues (name, country, count_matches)
values ('Premier League', 'Great Britain', 100);

insert into football_leagues (name, country, count_matches)
values ('Laliga', 'Spain', 100);

insert into football_leagues (name, country, count_matches)
values ('RPL', 'Russia', 100);

insert into coach_statistics (won_mathes, count_matches, count_trophies)
values (49, 100, 1);
insert into coach_statistics (won_mathes, count_matches, count_trophies)
values (70, 150, 0);
insert into coach_statistics (won_mathes, count_matches, count_trophies)
values (190, 300, 2);

insert into player_statistics (won_mathes, count_matches, count_trophies, count_assists, count_goals, red_cards)
values (100, 250, 2, 25, 20, 3);
insert into player_statistics (won_mathes, count_matches, count_trophies, count_assists, count_goals, red_cards)
values (100, 230, 2, 25, 67, 1);
insert into player_statistics (won_mathes, count_matches, count_trophies, count_assists, count_goals, red_cards)
values (167, 250, 1, 23, 40, 6);

insert into coasts (currency_recipient, currency_sender, exchange_rate)
values ('RUB', 'EUR', 2.61);
insert into coasts (currency_recipient, currency_sender, exchange_rate)
values ('RUB', 'GBP', 72.14);

insert into player_contracts (value, coast_id, start_date, end_date, salary, compensation_value)
values (250000, 1, '2001-09-28', '2003-09-28', 100, 10000);
insert into player_contracts (value, coast_id, start_date, end_date, salary, compensation_value)
values (2500000, 2, '2001-05-28', '2003-05-28', 1000, 100000);

insert into football_clubs
    (name, players_count, trophies_count, budget, rating)
values ('Manchester United', 30, 10, 20000000000, 40);
insert into football_clubs
    (name, players_count, trophies_count, budget, rating)
values ('Real Madrid', 35, 18, 15000000000, 50);
insert into football_clubs
    (name, players_count, trophies_count, budget, rating)
values ('Zenit', 28, 15, 1500000000, 20);

insert into players (name, surname, age, position, statistic, contract, rating, football_club)
values ('Cristiano', 'Ronaldo', 38, 'Atacker', 1, 1, 90, 1);
insert into players (name, surname, age, position, statistic, contract, rating, football_club)
values ('Erling', 'Haaland', 23, 'Atacker', 2, 2, 98, 2);
insert into players (name, surname, age, position, statistic, contract, rating, football_club)
values ('Kai', 'Hawertz', 25, 'Atacker', 2, 2, 95, 3);

insert into players_club(player_id, club_id)
values (1, 1);
insert into players_club(player_id, club_id)
values (2, 2);
insert into players_club(player_id, club_id)
values (3, 3);

insert into sport_directors(name, surname, age,football_club)
values ('Alex', 'Backhem', 25, 1);
insert into sport_directors(name, surname, age,football_club)
values ('Andrew', 'Looser', 28, 2);
insert into sport_directors(name, surname, age,football_club)
values ('Pavel', 'Black', 23, 3);

insert into coaches(name, surname, age, football_club, rating, statistic) values ('Mourinio','Vendeta',42,1,23,1);
insert into coaches(name, surname, age, football_club, rating, statistic) values ('Petya','Vasyin',45,2,40,2);
insert into coaches(name, surname, age, football_club, rating, statistic) values ('Josef','Ket',50,3,67,3);

insert into transfer_request(value,coast_id,club_from,club_to,player_id) values (120000,1,3,2,3);

insert into exchange_request(player_id, club_from, player_get, club_to) values (2,2,1,1);

insert into club_league(club_id, league_id) values (1,1);
insert into club_league(club_id, league_id) values (2,2);
insert into club_league(club_id, league_id) values (3,3);

