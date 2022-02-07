# Using COSMiC miner to mine Seasonal Tokens under Ubuntu Linux

## Installing

To get started with mining Seasonal Tokens, you can run

    $ ./activate_miner

from this directory. This will attempt to install the correct NVIDIA drivers
for your environment if they are not already installed, and will cause the
miner to launch when the machine is rebooted. It will also create a new 
0xbitcoin vault file (if you don't have one already), which will already be
set up to mine from the Seasonal Tokens mining pool server of your choice.

This will also detect the number of GPUs on your machine and enable all of them
for mining.

The file cosmic-v3.4-linux is the only binary file included in this bundle.
If you would prefer to use the original cosmic-v3.4-linux from LieutenantTofu's
COSMiC bitbucket repository, you can run

    $ ./activate_miner -o

or

    $ ./activate_miner --original

This will download the original bundle from that repository and extract the
cosmic-v3.4-linux binary to this location.


## Managing COSMiC miner for a single GPU

You can manually launch the miner at any time by running

    $ ./run_cosmic [token name] 

from this directory. So if you want to mine spring token, you can run

    $ ./run_cosmic spring

If you run without any arguments, as

    $ ./run_cosmic

you will continue mining whatever token you were mining before.

You can stop all running instances by running

    $ ./stop_cosmic

To switch to mining a different seasonal token, you can run

    $ ./switch_pools [token]

So to switch to mining summer, you would run

    $ ./switch_pools summer

To see the miner instances that are running, run

    $ ./list_running_miners

which will show you whether the mining process is running, and what token is
currently being mined. For a more complete summary, including the temperatures
of your cards, run

    $ nvidia-smi

which will provide temperatures and power usage for your NVIDIA graphics cards.

To attach to your running COSMiC miner session, run

    $ tmux attach -t cosmic

You can exit the tmux session without stopping the miner by detaching it. The
default key combination to detach from a tmux session is 

    <Ctrl> b + d

(hold down the left control key, press b, release the left control key, press d)


## Managing COSMiC miner for multiple GPUs

After activating with 

    $ ./activate_miner

you can manually launch the miner at any time by running

    $ ./run_cosmic

This will launch one miner per GPU. To launch cosmic miner on a single GPU,

    $ ./run_cosmic [card number]

or

    $ ./run_cosmic [card number] [token]

from this directory.  So if you want to mine spring token on your second card, 
you can run this as

    $ ./run_cosmic 2 spring

If you run with just a single argument, like

    $ ./run_cosmic 2 

you will continue mining whatever token you were mining before on that card.  

You can stop all running instances by running

    $ ./stop_cosmic

To stop an instance on a particular GPU, you can run

    $ ./stop_cosmic [card number]

So to stop running the miner on your second card, you would run

    $ ./stop_cosmic 2 

To switch all of your GPUs to mine a particular seasonal token, run

    $ ./switch_pools [token]

So to switch all your GPUs to mine summer, you would run

    $ ./switch_pools summer

To switch a particular GPU to mine a different seasonal token, run

    $ ./switch_pools [card number] [token]

So to mine summer on card 2, you would run

    $ ./switch_pools 2 summer

As with the single GPU example, to see the miner instances that are running, 
you can run

    $ ./list_running_miners

which will show you which mining processes are running, and what tokens are 
currently being mined. For a more complete summary, including the temperatures
of your cards, run

    nvidia-smi
 
To attach to your running COSMiC miner session, run

    $ tmux attach -t cosmic

You can switch between windows to view running COSMiC miner instances by typing

    <Ctrl> b + n

(hold down the left control key, press b, release the left control key, press n)
to go to the next window, and

    <Ctrl> b + p

(hold down the left control key, press b, release the left control key, press p)
to go to the previous window.

You can exit the tmux session without stopping the miner by detaching it. The
default key combination to detach from a tmux session is 

    <Ctrl> b + d

(hold down the left control key, press b, release the left control key, press d)


## Deactivating COSMiC miner

If you don't want COSMiC miner to run after every reboot, you can deactivate it
by running

    $ ./activate_miner -d

This will not remove any NVIDIA drivers that have been installed, nor will it
remove your vault file containing your cosmic miner configuration. This can be
found in 

    $HOME/.0xbitcoin/0xbtcminerstore/vaultdata


## Troubleshooting

If you encounter any problems, please visit the miner chat on the 
Seasonal Tokens discord server and ask for assistance. You can find a link 
to the discord server at

    https://seasonaltokens.org/community.html

