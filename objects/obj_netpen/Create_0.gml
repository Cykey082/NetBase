sock=network_create_socket(network_socket_udp)
buffer=buffer_create(1472,buffer_fixed,1)
if(sock<0)
{
	show_message("Unable to create any socket.")
	game_end(1)
}
port=0
begin//Try Flag up
	flag=instance_create_depth(x,y,depth,obj_netflag)
	//if(1+1==3)
end
beat=function(){
		buffer_pack(buffer,[[1013,buffer_u16],"PEN"])
		network_send_broadcast(sock,1013,buffer,buffer_tell(buffer))
	}
beat()
beat120=120
pens=ds_list_create()