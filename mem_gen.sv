class mem_gen;
	mem_tx tx, temp, txQ[$];

	task run();
		//$display("Generator functionality will happen.");

		case(mem_common::test_name)
			"1WR":begin
				tx=new();
				tx.randomize() with{tx.wr_rd==1'b1;};
				mem_common::gen2bfm.put(tx);
				tx.print("mem_gen");
			end
		
			"5WR":begin
				tx=new();
				repeat(5) begin
					tx.randomize() with{tx.wr_rd==1'b1;};
					temp=new tx;
					mem_common::gen2bfm.put(temp);
					tx.print("mem_gen");
				end
			end
			
			"1WR_1RD":begin

				//write
				tx=new();
				tx.randomize() with{tx.wr_rd==1'b1;};
				mem_common::gen2bfm.put(tx);
				tx.print("mem_gen");

				temp=tx;

				//read
				tx=new();
				tx.randomize() with{tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;};
				mem_common::gen2bfm.put(tx);
				tx.print("mem_gen");

			end
		
			"5WR_5RD":begin
				repeat(5) begin
					tx.randomize() with{tx.wr_rd==1'b1;};
					temp=new tx;
					mem_common::gen2bfm.put(temp);
					tx.print("mem_gen");
					txQ.push_back(temp);
				end

				repeat(5) begin
					temp=txQ.pop_front();
					tx=new();
					tx.randomize() with{tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;};
					mem_common::gen2bfm.put(tx);
					tx.print("mem_gen");
				end
		
			"NWR_NRD":begin
				repeat(mem_common::N) begin
					tx.randomize() with(tx.wr_rd==1'b1;);
					temp=new tx;
					mem_common::gen2bfm.put(temp);
					tx.print("mem_gen");
					txQ.push_back(temp);
				end

				repeat(mem_common::N) begin
					temp=txQ.pop_front();
					tx=new();
					tx.randomize() with{tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;};
					mem_common::gen2bfm.put(tx);
					tx.print("mem_gen");
				end
		
			end
	endtask
endclass
