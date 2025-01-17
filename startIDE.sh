#!/bin/bash
#
# Start Doyen IDE
#

imagePath=CuisImage
# Cuis release
release=`cat doyen/cuisRelease`
# version number, when dealing with rolling release
version=`ls $imagePath/Cuis$release-????.image | cut -d - -f 2 | cut -d . -f 1`
if [ -z "$version" ]
then
    cuis=Cuis$release
else
    cuis=Cuis$release-$version	
fi

ide=doyen
VM=CuisVM.app/Contents/Linux-x86_64/squeak

# Install image for Doyen IDE
cd $imagePath
rm $ide.image $ide.changes $ide.user.* *.log
cp $cuis.image $ide.image
cp $cuis.changes $ide.changes
cd -

$VM $imagePath/$ide -s doyen/src/setupDoyen.st 
