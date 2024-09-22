#[test_only]
module educational_competition::competition_tests {
    use std::signer;
    use aptos_framework::account;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use educational_competition::competition;

    #[test(admin = @educational_competition, user = @0x2)]
    public fun test_initialize_and_declare_winner(admin: signer, user: signer) {
        // Setup
        let admin_addr = signer::address_of(&admin);
        let user_addr = signer::address_of(&user);
        account::create_account_for_test(admin_addr);
        account::create_account_for_test(user_addr);
        coin::register<AptosCoin>(&admin);
        coin::register<AptosCoin>(&user);

        let (burn_cap, mint_cap) = coin::initialize<AptosCoin>(
            &admin,
            b"AptosCoin",
            b"APT",
            8,
            false,
        );

        // Mint some coins to admin
        let coins = coin::mint<AptosCoin>(100, &mint_cap);
        coin::deposit(admin_addr, coins);

        // Initialize competition
        competition::initialize_competition(&admin, 50);

        // Declare winner
        competition::declare_winner(&admin, user_addr);

        // Assert user received the prize
        assert!(coin::balance<AptosCoin>(user_addr) == 50, 0);

        // Cleanup
        coin::destroy_burn_cap(burn_cap);
        coin::destroy_mint_cap(mint_cap);
    }
}