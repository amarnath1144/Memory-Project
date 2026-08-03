`define WIDTH 8
`define DEPTH 32
`define ADDR_WIDTH $clog2(`DEPTH)

class mem_common;
	static string test_name;
	static int N;
	static mailbox gen2bfm=new();
	static mailbox mon2cov=new();
	static mailbox mon2sbd=new();

	static int matchings;
	static int mismatchings;

	static int gen_count;
	static int bfm_count;
	
endclass
