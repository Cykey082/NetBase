/*
flags init
	(1013)(FLG)
pen -> flags
	(1013)(PEN)
flag -> pen
	(1013)(BRD)(len)[(ip)(port)]
pen -> pen
	(1013)(INV)
pen <- pen
	(1013)(ACC)
*/
/// @desc  使用给定列表填充buffer。
/// @param {id.buffer} buffer  将被填充的buffer。
/// @param {array} var_struct  用于填充的元素数组。元素可以为实数(buffer_f64)、字符串(buffer_string)，或者上述类型与指定BufferDataType组成的数组。
function buffer_pack(buffer,var_struct)
{
	buffer_seek(buffer,buffer_seek_start,0)
	var len=array_length(var_struct)
	for(var i=0;i<len;i++)
	{
		var value=var_struct[i]
		var type=typeof(value)
		var format=undefined
		if(type=="array")
		{
			format=value[1]
			value=value[0]
		}
		else if(type=="number")
		{
			format=buffer_f64
		}
		else if(type=="string")
		{
			format=buffer_string
		}
		buffer_write(buffer,format,value)
	}
	return
}