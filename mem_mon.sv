class mem_mon;

	mem_tx tx;
	virtual mem_intrf vif;

	task run();
		//$display("monitor functionality will happen.");
		vif=tb.pif;

		forever begin
			@(vif.mon_cb);
			if(vif.mon_cb.valid==1 && vif.mon_cb.ready==1) begin
				tx=new();
				tx.wr_rd = vif.mon_cb.wr_rd;
				tx.addr  = vif.mon_cb.addr;
				tx.wdata = vif.mon_cb.wdata;
				if(tx.wr_rd==0) begin
					@(vif.mon_cb);
					tx.rdata = vif.mon_cb.rdata;
				end
				mem_common::mon2cov.put(tx);
				mem_common::mon2sbd.put(tx);
				//tx.print("mem_mon");
			end
		end
	endtask
endclass
