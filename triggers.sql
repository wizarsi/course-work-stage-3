create trigger new_player_contract
    after insert on player_contracts for each row
execute procedure add_player_contract();