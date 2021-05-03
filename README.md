# Map I/O

[![Arch build](https://github.com/cowlingj/map-io/actions/workflows/verify.yml/badge.svg)](https://github.com/cowlingj/map-io/actions/workflows/verify.yml)

Restrict a chosen input to a single display

## Installation 

Install map-io from source with `make build && make install`
The following distros have packages available:
- Arch (WIP), PKGBUILD

## Usage

Running the installed version from the command line can be done with
```bash
map-io
```

## Developing

### Run Locally

map-io can be executed with `make run`, this will run the local version of map-io
(even if another version is installed)

### Build

in order to build checksums must be kept upto date, this can be done with `make checksum`

## License

[MIT](https://choosealicense.com/licenses/mit/)

