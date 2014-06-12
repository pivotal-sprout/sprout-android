# 44 is currently the package ID for the Intel Atom system image for SDK level 19. If we use 'sysimg-19' it will
# try to install both system images, which causes 2 license challenges, which I don't know how to handle yet.

# These package IDs are not permanent. They can change whenever the list of packages stored on Google's servers change.
# Meaning this recipe is not very robust. A solution would be to parse the results of 'android list sdk --all' and find
# the ID for the Intel Atom image.
node.default['sprout']['android']['atom_system_image_package_id'] = 44
