class mem_tx;
	//common properties, methods and constraints
	rand bit wr_rd;
	rand bit[`ADDR_WIDTH-1:0]addr;
	rand bit[`WIDTH-1:0]wdata;
		 bit[`WIDTH-1:0]rdata;

	function void print(input string str="mem_tx");
		$display("%0t: --------------%0s-------------",str);
		$display("wr_rd=%b",wr_rd);
		$display("addr=%0d",addr);
		$display("wdata=%0d",wdata);
		$display("rdata=%0d",rdata);
	
	endfunction
endclass
