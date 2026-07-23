interface mem_intrf(input reg clk,res);
	bit wr_rd;
	bit ['ADDR_WIDTH-1:0]addr;
	bit ['WIDTH-1:0]wdata,rdata;
	bit valid,ready
endinterface
