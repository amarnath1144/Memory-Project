class mem_sbd;

	mem_tx tx;

	int asso[*];

	task run();
		//$display("sbd functionality will happen.");
		
		forever begin
			mem_common::mon2sbd.get(tx);
			//tx.print("mem_sbd");
			if(tx.wr_rd==1) asso[tx.addr]=tx.wdata;
			else begin
				if (asso[tx.addr]==tx.rdata) begin
				//	$display("rdata=%0d,asso[%0d]=%0d",tx.rdata,tx.addr,asso[tx.addr]);
					mem_common::matchings++;
				end
				else begin
				//	$display("rdata=%0d,asso[%0d]=%0d",tx.rdata,tx.addr,asso[tx.addr]);	
					mem_common::mismatchings++;
				end
			end
			
		end
	endtask
endclass
