#!/usr/bin/env python3

import json
import sys
import os.path

try:
    pools = {}
    pools['spring'] = 'http://pool.seasonaltokens.org:5001'
    pools['summer'] = 'http://pool.seasonaltokens.org:5002'
    pools['autumn'] = 'http://pool.seasonaltokens.org:5003'
    pools['winter'] = 'http://pool.seasonaltokens.org:5004'

    rpools = {v:k for k,v in pools.items()}


    vault_path = os.path.join(os.path.expanduser("~"), '.0xbitcoin',
                              '0xbtcminerstore', 'vaultdata')

    try:
        with open(vault_path) as vault_file:
            vault_data = json.load(vault_file)
    except IsADirectoryError:
        print("Cannot read current vault data. Please move your vault to another "
              + "location and try again. Current location is " + vault_path)
        sys.exit(1)
    except FileNotFoundError:
        print("Vault file does not exist. Please run COSMiC to create a vault.")
        sys.exit(1)

    current_pool = vault_data['vault']['data']['mining_pool_url']

    if current_pool in rpools.keys():
        print("Current mining pool is " + rpools[current_pool])
    else:
        print("Current mining pool is " + current_pool)

    if len(sys.argv) < 2:
        sys.exit(0)

    new_pool = sys.argv[1]

    if new_pool not in pools.keys():
        print("Please select from the SeasonalTokens mining pools " +
               "(spring, summer, autumn, winter)")
        sys.exit(1)

    if current_pool in rpools and rpools[current_pool] == new_pool:
        print("New pool is the same as the previous pool.")
        #sys.exit(1)

    print("Changing to %s pool" % new_pool)

    vault_data['vault']['data']['mining_pool_url'] = pools[new_pool]

    with open(vault_path, "w") as vault_file:
        json.dump(vault_data, vault_file)

except KeyboardInterrupt:
    print("")
    exit(1)
