This directory should contain a reasonable configuration and scripts to get you started.

To use this you need to:

1. Rename this "sample" directory to the name of your Tinc network.

2. Put the other host config files in the hosts/ directory.

3. Rename tinc.conf.sample to tinc.conf (This 'enables' this Tinc network)

4. Edit tinc.conf so it attempts to connect to another host.

5. Restart Tinc on your device.


Notes:

* This machine was given the host name from the $HOSTNAME enviromental var
at the time the same config was generated. If you want a different name you can
change the Qnap settings, delete this sample directory and restart Tinc.
Or edit: tinc.conf, subnet-up subnet-down and rename hosts/HostName

* I tried to autogenerate a unique IP address for this device from it's mac addr.
If you pick a more memorable IP address by editing tinc-up and hosts/HostName

* Consult https://github.com/sandymac/qnap-tinc for more info if needed.
