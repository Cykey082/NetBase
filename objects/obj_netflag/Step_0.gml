if(flag>=0)exit
if(recr--)exit
else recr=120
flag=network_create_socket_ext(network_socket_udp,1013)
myip=undefined
ds_list_clear(pens)

if(flag<0)exit
buffer_pack(buffer,[[1013,buffer_u16],"FLG"])
network_send_broadcast(flag,1013,buffer,buffer_tell(buffer))