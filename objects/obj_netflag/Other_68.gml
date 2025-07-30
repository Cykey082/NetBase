if(async_load[?"id"]	!=flag)					exit
if(async_load[?"type"]	!=network_type_data)	exit
if(async_load[?"size"]	<5)						exit
var b=async_load[?"buffer"]
var code=buffer_read(b,buffer_u16)
	if(code!=1013)exit
var ip=async_load[?"ip"]
var port=async_load[?"port"]
	code=buffer_read(b,buffer_string)
if(is_undefined(myip))
{
	myip=ip
	show_debug_message(myip)
}
if(code!="PEN")exit

var i=0
var tar=-1
while(i<ds_list_size(pens))
{
	if(ip==pens[|i][0]&&port==pens[|i][1])
	{
		tar=i++
		pens[|tar][2]=current_time
	}//found,update
	else if(current_time-pens[|i][2]>5000)ds_list_delete(pens,i)//expire,kill
	else i++														//normal,skip
}
if(tar==-1)															//not in,add
{
	ds_list_add(pens,[ip,port,current_time])
	show_debug_message("IP "+ip+" PORT "+string(port))
	tar=ds_list_size(pens)
}
if(ip==myip)
{
	//(1013)(BRD)(len)[(ip)(port)]
	var len=ds_list_size(pens)
	var pack=[[1013,buffer_u16],"BRD",len]
	for(i=0;i<ds_list_size(pens);i++)
	{
		pack=array_concat(pack,[pens[|i][0],pens[|i][1]])
	}
	//show_debug_message("Pack: "+string(array_length(pack)))
	//for(i=0;i<array_length(pack);i++)
	//show_debug_message(pack[i])
	buffer_pack(buffer,pack)
	network_send_udp(flag,ip,port,buffer,buffer_tell(buffer))
}