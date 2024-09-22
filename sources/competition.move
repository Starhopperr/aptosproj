module educational_competition::competition {
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Competition has key {
        prize_pool: u64,
        winner: address,
    }

    const E_NOT_INITIALIZED: u64 = 1;
    const E_ALREADY_INITIALIZED: u64 = 2;
    const E_NOT_ENOUGH_BALANCE: u64 = 3;
    const E_NOT_AUTHORIZED: u64 = 4;

    public fun initialize_competition(account: &signer, initial_prize: u64) {
        let account_addr = signer::address_of(account);
        assert!(!exists<Competition>(account_addr), E_ALREADY_INITIALIZED);
        assert!(coin::balance<AptosCoin>(account_addr) >= initial_prize, E_NOT_ENOUGH_BALANCE);

        coin::transfer<AptosCoin>(account, @educational_competition, initial_prize);

        move_to(account, Competition {
            prize_pool: initial_prize,
            winner: @0x0,
        });
    }

    public entry fun declare_winner(account: &signer, winner_address: address) acquires Competition {
        let account_addr = signer::address_of(account);
        assert!(exists<Competition>(account_addr), E_NOT_INITIALIZED);
        assert!(account_addr == @educational_competition, E_NOT_AUTHORIZED);

        let competition = borrow_global_mut<Competition>(account_addr);
        competition.winner = winner_address;

        coin::transfer<AptosCoin>(&account, winner_address, competition.prize_pool);
        competition.prize_pool = 0;
    }
}
