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
