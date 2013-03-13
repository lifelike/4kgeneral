#!/bin/sh

. ./env.`hostname -s`

$MAKE debug/G.class
cd debug
java G
