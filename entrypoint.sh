#!/bin/sh

cp -r /root/.cargo  $HOME/
cp -r /root/.rustup $HOME/

cd $3

west $1 $2
