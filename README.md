Abstract
--------
chat is a minimalistic FIFO and filesystem based IRC client.  It creates an irc
directory tree with server, channel and nick name directories.  In every
directory a FIFO file (in) and and normal file (out) is placed.

The in file is used to communicate with the servers and the out files include
the server messages. For every channel and every nick name there will be new in
and out files.

The basic idea of this is to be able to communicate with an IRC server with
standard command line tools.  For example if you want to join a channel just do
echo "/j #channel" > in and chat creates a new channel directory with in and out
file.

Installation
------------
Edit config.mk to match your local setup. chat is installed into
/usr/local by default.

Afterwards enter the following command to build and install chat (if
necessary as root):

    $ make clean install

Running chat
------------
Simply invoke the 'chat' command with required arguments

To make chat a bit more comfortable use it in combination with the multitail
program and for example with vim. Run vim in the server directory and use
key mapping like:
map w1 :.w >> \#chat/in<cr>
map w2 :.w >> \#wmchat/in<cr>
to post to channels.

If you use the next editor line for a new posting you can use ctrl-p for nick
completion if you wrote the nick in the past.

Configuration
-------------
No configuration is needed.
