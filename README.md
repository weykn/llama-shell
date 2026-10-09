# llama-shell
llama-shell is a (currently) very minimal shell for Linux, and possibly other
UNIXes, although I have only tested on Linux. It is, as of yet, a work in
progres, so you probably shouldn't replace bash just yet, but it is steadily
developing and will hopefully be a full-featured, POSIX compliant shell in the
near future.

## Update
* llama-shell supports the I/O redirection operators >, >>, <, <, 2>, 2>>, and &>. To
use these operators, they currently must be separated on both sides by
whitespace (ls > outfile not ls>outfile).
* llama-shell now handles signals correctly :). SIGINT and SIGQUIT both function
exactly as expeded, terminating the process in question. However, as support
for background processes has not yet been implemented, SIGTSTP, SIGTTIN, and
SIGTTOU will also terminate the process and print a message. This will be
addressed when background processes are implemented

## Development
*This is the development branch of llama-shell*. Things in this branch will
often be broken, or not work as well as they should. This is currently a
learning project so I am not taking pull requests at this time. I hope to grow
this into a full-featured shell, at which point I will welcome contributions.

## TO-DO List
- [x] Implement signal handling for SIGINT, SIGQUIT, and SIGTSTP
- [ ] Allow for process backgrounding
- [x] Implement I/O redirection (i.e. >, >>, etc.)
- [ ] Implement I/O pipes (|)
- [ ] Make a config file
- [ ] Tab completion
- [ ] History
- [ ] Other cool stuff?

## Installation
To build llama-shell, clone the repository and run:
```sh
make
```
The binary is placed in `build/`. To build and start it, run:
```sh
make run
```
To remove the build files, run:
```sh
make clean
```

If you want to formally install it (it's not really a full featured shell yet
so I'd avise against it), run as root:
```sh
make install
```
This installs to `/usr/local/bin` by default; set `PREFIX` to change that
(e.g. `make install PREFIX=$HOME/.local`).

To uninstall, run as root (with the same `PREFIX` if you changed it):
```sh
make uninstall
```
