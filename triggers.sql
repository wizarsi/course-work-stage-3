create trigger new_player_contract
    after insert on player_contracts for each row
execute procedure add_player_contract();

create trigger add_club_to_sport_director
    after insert on football_clubs for each row
execute procedure add_club_to_sport_director();

create trigger add_coach_to_football_club
    after insert on coaches for each row
execute procedure add_coach_to_football_club();
