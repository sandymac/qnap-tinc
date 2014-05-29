qnap-tinc
=========

Tinc VPN package for the Qnap NAS platforms

Tinc Compile Notes
==================

The configure script from the tinc package will fail
on the sed that comes with your qnap. If you install
sed from the Optware package and run the commands
below as admin, the ./configure script should succeed. 

```
cd /bin/
mv sed sed-busybox
ln -s /opt/bin/sed sed
```

How to use this
===============
This simply provides a QDK enviroment for Tinc on Qnap devices. 
It does not provde a installable binary package. You will need to:

1. Compile Tinc for your device. On an x86 Qnap http://james.vautin.com/?p=285 can be helpful but he's wrong about gawk, the problem is with sed, see above.
2. ssh into your Qnap and check this repo out with git.
3. copy your compiled tincd binary into the x86 dir. (other platform specific dirs might work for those platforms.)
4. Run qbuild to produce a .qpkg you can install.

The Tinc qpkg this generates needs a share named "Tinc". I suggest you make this share very private, so no users can access it after setup. For each /share/Tinc/[netname]/tinc.conf an instance of Tinc will be started for that netname's config directory.

Also, when the Tinc qpkg starts it will look for /share/Tinc/sample. If that doesn't exist it will create a stub network config directory containing the tinc scripts I like and auto generate private and public keys. You should then rename this directory to your desired netname and then rename/edit the tinc.conf.sample file to tinc.conf . You'll need to provide the other ../hosts/HostName files.

Reminder: Once you get this running, remoke access by all users as they don't need it for Tinc to work and you don't want to accidently leak your private key.

As of May 29, 2014 all my Qnap devices are deployed remotely and there won't be more updates until I have a need for more Qnaps. I'll still try to field support requests to help get people started.
