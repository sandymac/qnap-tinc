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
