create or replace function add_player_contract() returns trigger as
$$
declare
begin
    update players set contract = new.id where id = new.player_id;
    if new.end_date < now()
    then
        update players set football_club = null where id = new.player_id;
    end if;
    return new;
end
$$ language plpgsql;

create or replace function budget_for_salaries(club_id int default null) returns int as
$$
begin
    if club_id is null
    then
        return 0;
    end if;
    return (select sum(player_contracts.salary) from players
                 join player_contracts on players.contract = player_contracts.id
                 where players.football_club = club_id) * 12;
end
$$ language plpgsql;

select budget_for_salaries(1);
select budget_for_salaries(3);


create or replace function add_club_to_sport_director() returns trigger as
$$
begin
    update sport_directors set football_club = new.id where id = new.sport_director;
    return new;
end
$$ language plpgsql;

create or replace function add_coach_to_football_club() returns trigger as
$$
begin
    update football_clubs set coach = new.id where id = new.football_club;
    return new;
end
$$ language plpgsql;

create or replace function add_rating_to_coach() returns trigger as
$$
declare
    rat double precision := 0;
begin
    rat = (select won_mathes from coach_statistics where id = new.statistic)::numeric /
          (select count_matches from coach_statistics where id = new.statistic) * 50 +
          (select count_trophies from coach_statistics where id = new.statistic)::numeric / 20 * 50;
    update coaches set rating = floor(rat)::int where id = new.id;
    return new;
end
$$ language plpgsql;

create or replace function add_rating_to_player() returns trigger as
$$
declare
    rat double precision := 0;
begin
    rat = (select won_mathes from player_statistics where id = new.statistic)::numeric /
          (select count_matches from player_statistics where id = new.statistic) * 40 +
          (select count_trophies from player_statistics where id = new.statistic)::numeric / 20 * 20 +
          ((select count_assists from player_statistics where id = new.statistic) +
          (select count_goals from player_statistics where id = new.statistic))::numeric / 100 * 30 -
          (select red_cards from player_statistics where id = new.statistic)::numeric / 15 * 10;
    update players set rating = floor(rat)::int where id = new.id;
    return new;
end
$$ language plpgsql;


