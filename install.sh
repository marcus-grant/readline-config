###################################
# Install script for this dotfile #
###################################

# foolproof way to figure out where this script is placed
source="${BASH_SOURCE[0]}"
while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
      dir="$( cd -P "$( dirname "$source" )" && pwd )"
      source="$(readlink "$source")"
      # if $source was a relative symlink, we need to resolve it relative
      # to the path where the symlink file was located
      [[ $source != /* ]] && source="$dir/$source"
done
dir="$( cd -P "$( dirname "$source" )" && pwd )" #dir now has the script locat'n
link_destination=$dir/.inputrc
link_origin=$HOME/.inputrc

echo ""
echo "Preparing this configuration by linking this dotfile folder location."
echo ""

if [ -e $link_origin ]; then
    echo "$link_origin already exists, deleting."
    echo ""
    rm -rf $link_origin
fi

echo "Linking..."
ln -s $link_destination $link_origin
echo "$link_origin -> $link_destination"
echo ""
echo "Dotfile applied, bye!"
