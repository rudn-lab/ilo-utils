# ilo-utils - How to make managing iLO sane under Linux

If this is in any way shape or form helpful to you: Please also check LICENSE.md and consider leaving me a tip on ko-fi:

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/R6R8DQO8C)

![image](https://user-images.githubusercontent.com/25175069/178159517-26c0ddef-30bc-4c48-ad57-1b4eeb40206e.png)

## Installation

- check PREPARATIONS.md
- update the 3 iLO-sections below after having read the IMPORTANT HINTS section directly above them to make your servers known to the generator
- run base-install.sh to get mitmproxy and the right Java version
- run generate-ilo-scripts.sh to update all scripts and the autogen section in this README file
- read the Quick Start, be happy :D

## Quick Start

NOTE for iLO 2 users: If you really still have one of these ancient specimen: iLO 2 is not covered by the script generator, but after performing the setup above you can give '2' as a version when prompted directly to the ./ilo-console.sh script. The jar File is covered in there, so generally that should work as well.

To run a remote console for an iLO server, run the corresponding script in 'ilo-console-scripts'.

To ssh to the CLI of any iLO server, run the corresponding script in 'ilo-ssh-scripts'.

If you update any of the iLO server lists below (please mind the IMPORTANT HINTS section!), re-run the `generate-ilo-scripts.sh` script and commit the results after checking them.
This script takes care about updating everything. If you happen to use the generated iLO 3 proxy service, make sure to pull in this repository on the server where the proxy runs
and re-run the install script to update the service with any new potential iLO 3 machines or (more likely) remove old ones that have been decommissioned.

To locally connect to an iLO 3 webpage, which normally does not open in modern browsers, run the corresponding script from 'ilo-proxy-scripts' and then connect to the displayed
local URL. (https://127.0.0.1:9443)
If running this fails, make sure you have `socat` installed on your system (in Fedora it can be simply installed using `dnf`).
In Firefox you will have to accept the clamped certificate by the proxy which is used to mask the old TLSv1.1 cipher on the iLO 3 interfaces.

You can also use the proxies running on one of your servers, which are installed there using the provided install script in this repo.
If you do this, please adapt the 'PROXY_IP' setting in `generate-ilo-scripts.sh` so that the links below will be correct for iLO 3.
For your convenience, here are all the iLO webpage links the generator could derive.

DO NOT EDIT - AUTOGENERATED

- example-server1-ilo - https://192.168.150.100:34001/
- example-server2-ilo - https://192.168.150.100:34002/
- example-server3-ilo - https://192.168.150.100:34003/
- example-server4-ilo - https://192.168.150.4/
- example-server5-ilo - https://192.168.150.5/
- example-server6-ilo - https://192.168.150.6/

END DO NOT EDIT - AUTOGENERATED


## IMPORTANT HINTS about this file

ATTENTION: The 3 following sections for iLO3, 4 and 5 are a living/executable spec.
These are grepped by the `generate-ilo-scripts.sh` tool to generate remote console, ssh and (for iLO 3) proxy scripts to make iLO easily usable under Linux.
So if any IPs or names change, or Servers are added or removed, keep them consistent here and re-run the script, commit these changed files afterwards.

DO NOT USE THE PREFIXES in small letters and the attached iLO version as seen below without the space anywhere in this file except for the lists below.
We grep for these, and if they are used outside the lists below the resulting scripts will be garbage.
Use the official 'iLO' name instead and attach the version with a space, e.g. 'iLO 3' in the remaining text.

## List of old iLO 3 devices in our network

```
# follow exactly this syntax - iLO-tag with version <space> name-of-the-servers-ilo-without-spaces <space> IP
# the name doesn't have to be any known DNS name in your network, it is just for conventient identification and
# will be used in naming the scripts and the links above
ilo3 example-server1-ilo 192.168.150.1
ilo3 example-server2-ilo 192.168.150.2
ilo3 example-server3-ilo 192.168.150.3
```

## List of iLO 4 devices where using java console might be favorable (HTML5 virtual media is laggy)

```
# comments can be used here
ilo4 example-server4-ilo 192.168.150.4
ilo4 example-server5-ilo 192.168.150.5
```

## List of iLO 5 devices, these should be usable without any hacks, but the ./ilo-console.sh works anyway

```
ilo5 example-server6-ilo 192.168.150.6
```

## List of other/special hosts

```
# here you can keep anything for your doc puposes which doesn't have an iLO, it will not be picked up
example-hpc7000-mgmt 192.168.150.249 Blade Center, no remote console
example-supermicro-ipmi 192.168.150.100 Supermicro Server, use HTML5 console from web interface
```


## ilossh Info

Use ilossh alias or one of the generated ilossh scripts to login to older iLO 3:

```
alias ilossh='ssh -oKexAlgorithms=+diffie-hellman-group14-sha1 -oHostKeyAlgorithms=+ssh-dss -oCiphers=+aes256-ctr -l Administrator '
```

When logged in, you can navigate the config using the `show` command, and manipulate the setting using `set`.

E.g. to enable the AES ciphers so that the remote console can work under linux, do this:

```
show map1/config1
set /map1/config1 oemhp_enforce_aes=yes
```

Or to change the ilo hostname:

```
show /map1/enetport1
set /map1/enetport1 SystemName=your-hostname-that-you-want-to-set
```
