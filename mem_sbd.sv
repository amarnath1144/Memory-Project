class mem_sbd;

	mem_tx tx;

	task run();
		//$display("sbd functionality will happen.");
		
		forever begin
			mem_common::mon2sbd.get(tx);
			tx.print("mem_sbd");
		end
	endtask
endclass
