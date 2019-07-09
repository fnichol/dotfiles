# dotfiles

A personal set of Unix "[dotfiles]" to configure various programs.

|         |                                           |
| ------: | ----------------------------------------- |
| License | [![Crate license][badge-license]][github] |

**Table of Contents**

<!-- toc -->

- [Installation](#installation)
  - [Workstation](#workstation)
  - [homeshick](#homeshick)
  - [Homesick](#homesick)
- [Issues](#issues)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

<!-- tocstop -->

## Installation

### Workstation

The author mainly consumes this project via a [Workstation] automation project
which sets up and manages several [homeshick] repos across Linux, macOS, and
FreeBSD. See the [Workstation] project for more details.

### homeshick

This project is structured to work with [homeshick] which uses Git to track
updates and changes. Installing homeshick involves cloning a Git repository and
loading a shell function:

```sh
# Clone the codebase repo
git clone https://github.com/andsens/homeshick.git "$HOME/.homesick/repos/homeshick"
# Add the shell function to Bash shell sessions
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
# Load the function into the current shell
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
```

If you are installing on macOS and use [Homebrew], then you can optionally
install homeshick with:

```sh
brew install homeshick
```

Finally, add this repository to your setup with:

```sh
homeshick clone fnichol/dotfiles
```

Then keep up to date with:

```sh
homesick pull dotfiles && homesick link dotfiles
```

See the [homeshick] project's documentation for more detailed usage (it's pretty
great).

### Homesick

[Homesick] is an older Ruby-based project which predates homeshick and works in
a very similar way. To install Homesick you will need an installation of Ruby
present and then simply:

```sh
gem install homesick
```

Finally, add this repository to your setup with:

```sh
homesick clone git://github.com/fnichol/dotfiles.git
homesick pull dotfiles && homesick symlink dotfiles
```

Then keep up to date with:

```sh
homesick pull dotfiles && homesick symlink dotfiles
```

## Issues

If you have any problems with or questions about this image, please contact us
through a [GitHub issue][issues].

## Contributing

You are invited to contribute to new features, fixes, or updates, large or
small; we are always thrilled to receive pull requests, and do our best to
process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub
issue][issues], especially for more ambitious contributions. This gives other
contributors a chance to point you in the right direction, give you feedback on
your design, and help you find out if someone else is working on the same thing.

**Note** that this project represents a very personalized workflow and setup and
so not all new features may ultimately be included. Don't be afraid to engage
however, the author is especially nerdy about configuration and workstation
setup ;)

## Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>).

## License

Licensed under the MIT license ([LICENSE.txt][license] or
<http://opensource.org/licenses/MIT>)

[badge-license]:
  https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square
[dotfiles]: https://wiki.archlinux.org/index.php/Dotfiles
[fnichol]: https://github.com/fnichol
[github]: https://github.com/fnichol/dotfiles
[homebrew]: https://brew.sh/
[homeshick]: https://github.com/andsens/homeshick
[homesick]: https://rubygems.org/gems/homesick
[issues]: https://github.com/fnichol/dotfiles/issues
[license]: https://github.com/fnichol/dotfiles/blob/master/LICENSE.txt
[workstation]: https://github.com/fnichol/workstation
