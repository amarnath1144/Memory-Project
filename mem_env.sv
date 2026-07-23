class mem_env;
	mem_agent agent;
	mem_sbd sbd;

	task run();
		//$display("env functionality will happen.");
		agent = new();
		sbd = new();

		fork
			agent.run();
			sbd.run();
		join
	endtask
endclass
