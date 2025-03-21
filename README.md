# nerdctl-toolbox

pocket-protector, a.k.a. nerdctl-toolbox (or `nerdbox`)

A tool, to avoid having to install software on the host.

See <https://en.wikipedia.org/wiki/Pocket_protector>

The image templates can be found in [templates](templates)

The default `$DISTRO` is debian, but that can be changed.

Default name for `$TOOLBOX` is nerdbox, can be changed.

## Requirements

`nerdctl` (macOS: brew install `lima`)

`envsubst` (macOS: brew install `gettext`)

## Usage

To create the Containerfile for the distribution:

`nerdbox setup`

To build the toolbox image, with the user added:

`nerdbox build`

To create the toolbox container and the volume:

`nerdbox create`

To enter a login shell environment in the toolbox:

`nerdbox shell`

To remove the toolbox container but not the volume:

`nerdbox remove`

To list the existing toolbox images and containers:

`nerdbox list`

To run an oneshot command in an ephemeral container:

`nerdbox run`

## Decoration

Decorate the shell prompt with an appropriate emoji:

```
user@nerdbox:~$ PS1=$(printf "\xf0\x9f\xa4\x93 %s " $PS1)
```

## Theme Tune

Definitely [NERDS: A Manifesto](https://youtu.be/6v9-Cp1Lkw4) by A Capella Science

"KNEEL BEFORE THE MIGHTY POCKET PROTECTOR"
