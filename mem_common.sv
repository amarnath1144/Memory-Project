`define WIDTH 8
`define DEPTH 32
`define ADDR_WIDTH $clog2('DEPTH)

class mem_common;
	static string test_name;
	static int N;
	static mailbox gen2bfm=new();
	
endclass
