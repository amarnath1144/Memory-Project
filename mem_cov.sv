class mem_cov;

	mem_tx tx;

covergroup CG;
		//	option.name ="MEM_COVERAGE";
		//	option.per_instance=1;

		WR_RD:coverpoint tx.wr_rd{
				bins WRITES = {1'b1};
				bins READS  = {1'b0};

				//	option.comment="WR_RD coverpoint happened";
				//	option.weight ="1";

		}
		ADDRESS:coverpoint tx.addr{
				//	ignore_bins ADDR0  = {5'b00000};
				//	ignore_bins ADDR1  = {5'b00001};
				//	illegal_bins ADDR2  = {5'b00010};
				//	illegal_bins ADDR3  = {5'b00011};
				//	ignore_bins ADDR4  = {5'b00100};
				//	bins ADDR5  = {5'b00100};
				//	bins ADDR6  = {5'b00101};
				//	bins ADDR7  = {5'b00111};
				//	bins ADDR8  = {5'b01000};
				//	illegal_bins ADDR9  = {5'b01001};
				//	bins ADDR10 = {5'b01010};
				//	bins ADDR11 = {5'b01011};
				//	bins ADDR12 = {5'b01100};
				//	bins ADDR13 = {5'b01100};
				//	bins ADDR14 = {5'b01101};
				//	bins ADDR15 = {5'b01111};
				//	bins ADDR16 = {5'b10000};
				//	bins ADDR17 = {5'b10001};
				//	bins ADDR18 = {5'b10010};
				//	bins ADDR19 = {5'b10011};
				//	bins ADDR20 = {5'b10100};
				//	bins ADDR21 = {5'b10100};
				//	bins ADDR22 = {5'b10101};
				//	bins ADDR23 = {5'b10111};
				//	bins ADDR24 = {5'b11000};
				//	bins ADDR25 = {5'b11001};
				//	bins ADDR26 = {5'b11010};
				//	bins ADDR27 = {5'b11011};
				//	bins ADDR28 = {5'b11100};
				//	bins ADDR29 = {5'b11101};
				//	bins ADDR30 = {5'b11110};
				//	bins ADDR31 = {5'b11111};

				//  bins ADDR[8] = {[0:31]};
				//	bins ADDR[] = {[0:31]};
				//	bins ADDR[] = {[0:31]} with(item%2==0);
				//  option.auto_bin_max= 32;

				//	bins ADDR0 ={[0:3]};
				//	bins ADDR1 ={[4:7]};
				//	bins ADDR2 ={[8:11]};
				//	bins ADDR3 ={[12:15]};
				//	bins ADDR4 ={[16:19]};
				//	bins ADDR5 ={[20:23]};
				//	bins ADDR6 ={[24:27]};
				//	bins ADDR7 ={[28:31]};

				//	option.comment="ADDRESS coverpoint happened";
				//	option.weight=3;
		}
		CROSS_WR_RD_ADDRESS: cross WR_RD,ADDRESS{
			//bins A= binsof(WR_RD.WRITES);
			//bins B = binsof(ADDRESS) intersect{[3:9]};
			//option.comment="Cross coverage of WR_DR and ADDRESS coverpoint happened";
			//option.weight=5;
		}
	endgroup

	function new();
		CG=new();
	endfunction

	task run();
		//$display("coverage functionality happens here");

		forever begin
			mem_common::mon2cov.get(tx);
			CG.sample();
		//	tx.print("mem_cov");
		end
	endtask

endclass
