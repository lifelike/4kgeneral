#!/bin/sh

. ./env.`hostname -s`

$MAKE G.jar
$OPEN G.html 2>/dev/null &


