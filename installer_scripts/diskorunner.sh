#!/usr/bin/env bash

# FIX: add check if path is correct
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount $1
