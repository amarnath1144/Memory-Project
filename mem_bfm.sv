class mem_bfm;

	mem_tx tx;

	virtual mem_intrf vif;

	task run();
		//$display("bfm functionality will happen.");
		
		vif=tb.pif;

		forever begin
			mem_common::gen2bfm.get(tx);
			drive_tx(tx);	
			tx.print("mem_bfm");
		end
	endtask

	task drive_tx(input mem_tx tx);
		@(posedge vif.clk);
		vif.wr_rd = tx.wr_rd;
		vif.addr  = tx.addr;
		vif.wdata = tx.wdata;
		vif.valid = 1;
		wait(vif.ready==1);
		
		if (tx.wr_rd==0) begin
			@(posedge vif.clk);
			tx.rdata = vif.rdata;
		end

		@(posedge vif.clk);
		vif.wr_rd = 0
		vif.addr  = 0
		vif.wdata = 0
		vif.valid = 0
	endtask
endclass
