flag=network_create_socket_ext(network_socket_udp,1013)
myip=undefined
buffer=buffer_create(1472,buffer_fixed,1)
pens=ds_list_create()
recr=120
if(flag<0)exit
buffer_pack(buffer,[[1013,buffer_u16],"FLG"])
network_send_broadcast(flag,1013,buffer,buffer_tell(buffer))