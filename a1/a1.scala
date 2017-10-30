import Array._
object Test
{

var count : Int = 0
var key : Int = -1
var array=ofDim[Int](count)
def main(args: Array[String])
	{
	println("Enter the number of elements")
	count = io.StdIn.readLine.toInt	
	println("Enter the numbers in sorted Order")
	array=ofDim[Int](count)
	for (i<- 0 to count -1 )
		{
		array(i)=io.StdIn.readLine.toInt	
		}	
	
	println("Enter the element to find")
	key=io.StdIn.readLine.toInt
	var x= binarySearch(array,key,0,count-1)
	println(x)
	}
def binarySearch(list : Array[Int],key:Int, start:Int, end: Int) : Int = {

	if(start>end) return -1

	val mid = start + (end-start+1)/2
	if(list(mid)==key)
		return mid
	else if(key<list(mid))
		return binarySearch(list,key,start,mid-1)
	else
		return binarySearch(list,key,mid+1,end)

}

}//Object Test
