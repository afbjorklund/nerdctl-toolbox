# nerdctl-toolbox

pocket-protector, a.k.a. nerdctl-toolbox (or `nerdbox`)

A tool, to avoid having to install software on the host.

The image templates can be found in [templates](templates)

The default `$DISTRO` is debian, but that can be changed.

Default name for `$TOOLBOX` is nerdbox, can be changed too.

## Usage

To build the toolbox image, with the user added:

`nerdbox build`

To create the toolbox container and the volume:

`nerdbox create`

To enter a login shell environment in the toolbox:

`nerdbox shell`

To remove the toolbox container but not volume:

`nerdbox remove`

To list existing toolbox images and containers:

`nerdbox list`

To run an oneshot command in an ephemeral container:

`nerdbox run`

## Theme

[NERDS: A Manifesto](https://youtu.be/6v9-Cp1Lkw4)
