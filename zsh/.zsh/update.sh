#!/bin/bash
(cd custom; ./update-custom.sh)
git submodule update --recursive --remote --merge
