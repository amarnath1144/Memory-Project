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
		@(posedge vif.bfm_cb.clk);
		vif.bfm_cb.wr_rd <= tx.wr_rd;
		vif.bfm_cb.addr  <= tx.addr;
		vif.bfm_cb.wdata <= tx.wdata;
		vif.bfm_cb.valid <= 1;
		wait(vif.bfm_cb.ready==1);
		
		if (tx.wr_rd==0) begin
			@(vif.bfm_cb);
			tx.rdata = vif.bfm_cb.rdata;
		end

		@(vif.bfm_cb);
		vif.bfm_cb.wr_rd <= 0;
		vif.bfm_cb.addr  <= 0;
		vif.bfm_cb.wdata <= 0;
		vif.bfm_cb.valid <= 0;
	endtask
endclass
