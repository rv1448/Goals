## KEY SUBNET FACTS

__Subnet 10.0.0.1/24:__

* ID: 10.1.1.0
* FIRST: 10.1.1.1
* LAST: 10.1.1.254
* B'cast: 10.1.1.255 

** Subnet is a predictable set of consecitive numbers
__SUBNET ID__: Lowest number in the subnet
__ADDRESS RANGE__: The numbers in between
__Sub BroadCast Address__: The highest number in theSubnet


** MASK = 32 Bits
 - PREFIX(P) + HOST(H) bits
 - Ex
```
|-----Mask 1's------|----------Mask 0's----|
|----PREFIX(P)------|----------HOST(H)-----|		
<-----------------32 Bits ----------------->
```
- Cannot mix ones and zero's, Zero's are allowed only after ones
- Number practical host devices we can attach to the subnet = 2 pow(H) - 2 


__Subnet Math__



__Subnet ID and	Subnet Broadcast Address__ 
	- Numerically Lowest Numbers
	- Binary: All host Bits 0 

__Subnet Broadcast Address__ 
	- Numerically Highest Number
	- Binary: All host Bits = 1

##SUBNET FACTS /16 and /24 

```
Example/24: 10.1.7.3 , 255.255.255.0

MASK: 			255.255.255.0
ADDRESS: 	 	10.1.7.3
SUBNET ID:   	10.1.7.0
FIRST ADDRESS: 	10.1.7.1
LAST ADDRESS: 	10.1.7.254
BROADCAST: 		10.1.7.255

Example/16: 10.200.100.200, 255.255.0.0

MASK: 			255.255.0.0
ADDRESS: 		10.200.100.200
SUBNET ID: 		10.200.0.0
FIRST ADDRESS: 
LAST ADDRESS: 
BROADCAST:
```

|---Binary---|-Decimal--|
|--00000000--|---0------|
|--10000000--|---128----|
|--11000000--|---192----|
|--11100000--|---224----|
|--11110000--|---240----|
|--11111000--|---248----|
|--11111100--|---252----|
|--11111110--|---254----|
|--11111111--|---255----|

```
Example/24: 10.1.7.3/23  

MASK: 			255.255.254.0
ADDRESS: 	 	10.1.7.3
SUBNET ID:   	10.1.6.0
FIRST ADDRESS: 	10.1.6.1 
LAST ADDRESS: 	10.1.7.254 
BROADCAST: 		10.1.7.255 
```

```
Example/24: 10.1.7.3/23  

MASK: 			255.255.240.0
ADDRESS: 	 	172.16.55.56
SUBNET ID:   	172.16.48.0
FIRST ADDRESS: 	172.16.48.1 
LAST ADDRESS: 	172.16.63.254
BROADCAST: 		172.16.63.255 
```
MagicNumber =256 - 240 = 16

```
Example/24: 10.200.100.100/26  

MASK: 			255.255.192.0
ADDRESS: 	 	10 .200.100.100
SUBNET ID:   	10 .200. .0
FIRST ADDRESS: 	10 .200. .1
LAST ADDRESS: 	10 .200. .254
BROADCAST: 		10 .200. .255 

Magic Number = 256 - 192 = 64 

```

```
Example: 

MASK: 255.254.0.0			 
ADDRESS: 10.1.7.3	 	 
SUBNET ID: 10.0.0.0  	 
FIRST ADDRESS: 10.0.0.1	 
LAST ADDRESS: 	10.1.255.254 
BROADCAST: 	10.1.255.255	  

Magic Number = 256 - 254 = 2 

```



- Calculate the magic number for the impartial octet (256 - MaskValue)
- Subnet id choose nearest multiple of the magic number and not greater 
- Broadcast address: Use the magic number multiple - 1



##IPV4 NETWORK

>> A predictable set of consective numbers
- Netwoek ID 
- Address Range
- Network Broadcast Address 
- Theoritical sizes 2 power 8, 2 power 16, 2 power 24 

>> Public Network
- IANA allocates Most of Address space as public(Unique in the Universe)
- Original Plan: Ask and Receive aPublic Class full Network

>> Private Network
- IANA Reserves Some Classful Networks for Special Purposes
- Private Networks: For USE within an organisation
- Private Networks + NAT: Clients can Communicate to internet


>>>> Original Plan -Public IP Networks(reserved for companies)

__Company 1__  1.0.0.0 ----->|   Only 1.X.X.X here 
__Company 2__  2.A.0.0 ----->|   Only 2.X.X.X here 
__Company 3__  3.0.0.0 ----->|   Only 3.X.X.X here
__Company 4__  4.0.0.0 ----->|   Only 4.X.X.X here

>> ClassFul Network Facts

 - Step 1: 
 		if mask = 255 
			Copy address to Network ID
			Copy Address octet to Network Broadcast Address
		if mask = 0 
			Copy address to Network ID
			Copy 255 in Network Broadcast Address

## Classless Addressing vs Classfull Addressing	  
> Ignore the classes in addressing { Prefix(p) + Host(H) = 32 bits}
> {Network(N) + Subnet(s) + Host(H) = 32} Size= 8,16,24

``` CLASSFULL-ADDRESSING
NETWORK + SUBNET + HOST
SUBNET =2 power s
HOST = 2 power h -2 
```

```Example 
IP: 172.16.0.0 
MASK: 255.255.255.0

Rules:

Network Octet     + Subnet Octet + Host Octet
N = 16                S = 8			H = 8
11111111 11111111   11111111        11111111

N : Subnetting Class B Network 172.16.0.0,so N = 16
H : Binary Mask Ends with 8 Binary 0s, so H = 8 
S : Number so that N + S + H, so S = 8         
```


``` Example-Class-A/15
IP  : 10.0.0.0
Mask: 255.254.0.0

```