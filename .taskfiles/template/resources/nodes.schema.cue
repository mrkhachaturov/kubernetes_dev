package config

import (
	"net"
	"list"
)

#Config: {
	nodes: [...#Node]
	_nodes_check: {
		name: list.UniqueItems() & [for item in nodes {item.name}]
		eth0_address: list.UniqueItems() & [for item in nodes {item.eth0_address}]
		eth1_address: list.UniqueItems() & [for item in nodes if item.eth1_address != _|_ {item.eth1_address}]
		eth0_mac_addr: list.UniqueItems() & [for item in nodes {item.eth0_mac_addr}]
		eth1_mac_addr: list.UniqueItems() & [for item in nodes if item.eth1_mac_addr != _|_ {item.eth1_mac_addr}]
	}
}

#Node: {
    name:          		=~"^[a-z0-9][a-z0-9\\-]{0,61}[a-z0-9]$|^[a-z0-9]$" & !="global" & !="controller" & !="worker"
    eth0_address:  		net.IPv4
    eth1_address?: 		net.IPv4
    controller:    		bool
    disk:          		string
    eth0_mac_addr: 		=~"^([0-9a-f]{2}[:]){5}([0-9a-f]{2})$"
    eth1_mac_addr?: 	=~"^([0-9a-f]{2}[:]){5}([0-9a-f]{2})$"
    schematic_id:  		=~"^[a-z0-9]{64}$"
    eth0_mtu?:     		>=1450 & <=9000
    eth1_mtu?:     		>=1450 & <=9000
    secureboot?:   		bool
    encrypt_disk?: 		bool
}

#Config
