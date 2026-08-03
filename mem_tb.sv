module tb;
	reg clk,res;

	mem_env env;

	mem_intrf pif(clk,res);

	memory dut(.clk(pif.clk),
			   .res(pif.res),
			   .wr_rd(pif.wr_rd),
			   .addr(pif.addr),
			   .wdata(pif.wdata),
			   .valid(pif.valid),
			   .rdata(pif.rdata),
			   .ready(pif.ready));

	always #5 clk=~clk;

	initial begin
		clk=0;
		res=1;
		repeat(2) @(posedge clk);
		res=0;
		assert($value$plusargs("test_name=%0s",mem_common::test_name));
		assert($value$plusargs("N=%0d",mem_common::N));
		env=new();
		env.run();
	end
	initial begin
		#20;
		wait(mem_common::gen_count==mem_common::bfm_count);
		#10;
		if(mem_common::matchings!=0 && mem_common::mismatchings==0) begin
			$display("**************** TEST PASSED **************");
			$display("matchings=%0d,  mismatchings=%0d",mem_common::matchings, mem_common::mismatchings);
		end
		else begin
			$display("**************** TEST FAILED **************");
			$display("matchings=%0d,  mismatchings=%0d",mem_common::matchings, mem_common::mismatchings);
		end
		$finish;
	end
endmodule


