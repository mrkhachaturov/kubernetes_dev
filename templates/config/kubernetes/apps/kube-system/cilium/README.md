# Cilium

## Mikrotik RouterOS BGP

```sh
router bgp 64513
  bgp router-id 10.1.135.1
  no bgp ebgp-requires-policy

  neighbor k8s peer-group
  neighbor k8s remote-as 64514

  neighbor 10.1.135.31 peer-group k8s
  neighbor 10.1.135.32 peer-group k8s
  neighbor 10.1.135.33 peer-group k8s
  neighbor 10.1.135.41 peer-group k8s
  neighbor 10.1.135.42 peer-group k8s
  neighbor 10.1.135.43 peer-group k8s

  address-family ipv4 unicast
    neighbor k8s next-hop-self
    neighbor k8s soft-reconfiguration inbound
  exit-address-family
exit
```
