#!/bin/sh

. ./env.`hostname -s`

$MAKE printable/G.class
cd printable
java G
