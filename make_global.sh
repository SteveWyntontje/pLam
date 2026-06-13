#!/bin/bash
################################################
# make the 'plam' command global in the system #
################################################

echo "Copying the import/ path to /usr/local/share/pLam/ ..."
mkdir -p /usr/local/share/pLam/
cp -r import/ /usr/local/share/pLam/
echo "module Config where" > src/Config.hs
echo "" >> src/Config.hs
echo "importPath = \"/usr/local/share/pLam/import/\"" >> src/Config.hs

path_to_bin=$(find .stack-work/install -name plam)
echo "Your path to plam binary is $path_to_bin"

plam_path="$(pwd)/$path_to_bin"

echo "... copying 'plam' to /usr/local/bin"
cp $plam_path /usr/local/bin

echo "... making it executable"
chmod +x /usr/local/bin/plam

echo "Success!"


