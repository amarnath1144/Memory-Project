class mem_cov;

	mem_tx tx;

	task run();
		//$display("coverage functionality happens here");

		forever begin
			mem_common::mon2cov.get(tx);
			tx.print("mem_cov");
		end
	endtask

endclass
