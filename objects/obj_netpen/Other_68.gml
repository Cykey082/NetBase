if(async_load[?"id"]	!=sock)				exit
if(async_load[?"type"]	!=network_type_data)exit
if(async_load[?"size"]	<5)					exit
var b=async_load[?"buffer"]
var code=buffer_read(b,buffer_u16)
	if(code!=1013)exit
var ip	=async_load[?"ip"]
var port=async_load[?"port"]
	code=buffer_read(b,buffer_string)
show_debug_message(code+ip)
if(code=="BRD")
{
	var len=buffer_read(b,buffer_f64)
	for(var i=0;i<len;i++)
	{
		show_debug_message(buffer_read(b,buffer_string))
		show_debug_message(buffer_read(b,buffer_f64))
		show_debug_message(114514)
	}
}