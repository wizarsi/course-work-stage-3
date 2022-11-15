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
                 where players.football_club = club_id);
end
$$ language plpgsql;

select budget_for_salaries(1);
select budget_for_salaries(3);