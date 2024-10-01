module tec_addr::competition {
    use std::signer;
    use std::error;
    use std::string;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::event;

    /// Resource for storing competition details.
    struct Competition has key {
        prize_pool: u64,
        winner: address,
    }

    #[event]
    struct WinnerDeclared has drop, store {
        account: address,
        winner: address,
        prize_pool: u64,
    }

    /// Error codes
    const E_NOT_INITIALIZED: u64 = 1;
    const E_ALREADY_INITIALIZED: u64 = 2;
    const E_NOT_ENOUGH_BALANCE: u64 = 3;
    const E_NOT_AUTHORIZED: u64 = 4;

    /// Initializes a competition with a prize pool.
    public entry fun initialize_competition(account: &signer, initial_prize: u64) {
        let account_addr = signer::address_of(account);
        assert!(!exists<Competition>(account_addr), E_ALREADY_INITIALIZED);
        assert!(coin::balance<AptosCoin>(account_addr) >= initial_prize, E_NOT_ENOUGH_BALANCE);

        coin::transfer<AptosCoin>(account, @educational_competition, initial_prize);

        move_to(account, Competition {
            prize_pool: initial_prize,
            winner: @0x0,
        });
    }

    /// Declares the winner of the competition and transfers the prize pool.
    public entry fun declare_winner(account: &signer, winner_address: address) acquires Competition {
        let account_addr = signer::address_of(account);
        assert!(exists<Competition>(account_addr), E_NOT_INITIALIZED);
        assert!(account_addr == @educational_competition, E_NOT_AUTHORIZED);

        let competition = borrow_global_mut<Competition>(account_addr);
        assert!(competition.prize_pool > 0, E_NOT_INITIALIZED); // Ensure there's a prize pool

        // Emit the WinnerDeclared event
        event::emit(WinnerDeclared {
            account: account_addr,
            winner: winner_address,
            prize_pool: competition.prize_pool,
        });

        // Transfer prize to winner
        coin::transfer<AptosCoin>(&account, winner_address, competition.prize_pool);

        // Reset the prize pool to zero
        competition.prize_pool = 0;
    }

    /// Retrieves the prize pool of the competition.
    #[view]
    public fun get_prize_pool(addr: address): u64 acquires Competition {
        assert!(exists<Competition>(addr), error::not_found(E_NOT_INITIALIZED));
        borrow_global<Competition>(addr).prize_pool
    }

    #[test(account = @0x1)]
    public entry fun test_declare_winner(account: signer, winner: address) acquires Competition {
        let test_prize: u64 = 1000;
        aptos_framework::account::create_account_for_test(winner);

        initialize_competition(&account, test_prize);
        declare_winner(&account, winner);

        // Assert that prize pool is zero after winner is declared
        assert!(get_prize_pool(signer::address_of(&account)) == 0, E_NOT_INITIALIZED);
    }
}
