# Unofficial unbound image
This image embedds the Unbound DNS service.
It is derivated from the clean and very great ``klutchell/unbound`` image.

Have been added:
* an updated list of root servers stored in file ``/etc/unbound/root.hints``
* a list of servers to ban (https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts) and stored in file ``/etc/unbound/custom.conf.d/adsblock.conf``
