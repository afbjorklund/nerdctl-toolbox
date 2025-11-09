# nerdctl-toolbox

pocket-protector, a.k.a. nerdctl-toolbox (or `toolbox`)

A tool, to avoid having to install software on the host.

See <https://en.wikipedia.org/wiki/Pocket_protector>

The image templates can be found in [templates](templates)

The default `$DISTRO` is debian, but that can be changed.

Default name for `$TOOLBOX` is toolbox, can be changed.

## Requirements

`nerdctl` (macOS: brew install `lima`)

`envsubst` (macOS: brew install `gettext`)

## Usage

To create the Containerfile for the distribution:

`toolbox setup`

To build the toolbox image, with the user added:

`toolbox build`

To create the toolbox container and the volume:

`toolbox create`

To enter a login shell environment in the toolbox:

`toolbox shell`

To enter a root shell environment in the toolbox:

`toolbox root`

To remove the toolbox container but not the volume:

`toolbox remove`

To list the existing toolbox images and containers:

`toolbox list`

To copy many files at once, with rsync and not tar:

`toolbox rsync`

To run an oneshot command in an ephemeral container:

`toolbox run`

## System Info

To show some basic information about the system:

```
anders@toolbox:~$ ufetch

     ,---._   anders@toolbox
   /`  __  \  OS:        Debian 12.10
  |   /    |  KERNEL:    Linux 6.11.0-14-generic
  |   `.__.`  UPTIME:    1 minute
   \          PACKAGES:  93
    `-,_      SHELL:     bash
              UI:        unknown

```

## Decoration

Decorate the shell prompt with an appropriate emoji:

```
user@toolbox:~$ PS1=$(printf "\xf0\x9f\xa4\x93 %s " $PS1)
```

## Theme Tune

Definitely [NERDS: A Manifesto](https://youtu.be/6v9-Cp1Lkw4) by A Capella Science

"KNEEL BEFORE THE MIGHTY POCKET PROTECTOR"
