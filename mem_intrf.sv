interface mem_intrf(input reg clk,res);
	bit wr_rd;
	bit [`ADDR_WIDTH-1:0]addr;
	bit [`WIDTH-1:0]wdata,rdata;
	bit valid,ready

	clocking bfm_cb @(posedge clk);
		default input #0 output #1;

		input rdata,ready;
		output wr_rd,addr,wdata,valid
	endclocking
	
endinterface
