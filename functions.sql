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