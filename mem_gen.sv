class mem_gen;
	mem_tx tx, temp, txQ[$];

	task run();
		//$display("Generator functionality will happen.");

		case(mem_common::test_name)
			"1WR":begin
				tx=new();
				assert (tx.randomize() with{tx.wr_rd==1'b1;});
				mem_common::gen2bfm.put(tx);
				tx.print("mem_gen");
			end
		
			"5WR":begin
				tx=new();
				repeat(5) begin
					assert (tx.randomize() with{tx.wr_rd==1'b1;});
					temp=new tx;
					mem_common::gen2bfm.put(temp);
					tx.print("mem_gen");
				end
			end
			
			"1WR_1RD":begin

				//write
				tx=new();
				assert (tx.randomize() with{tx.wr_rd==1'b1;});
				mem_common::gen2bfm.put(tx);
				tx.print("mem_gen");

				temp=tx;

				//read
				tx=new();
				assert (tx.randomize() with{tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;});
				mem_common::gen2bfm.put(tx);
				tx.print("mem_gen");

			end
		
			"5WR_5RD":begin
				tx=new();
				repeat(5) begin
					assert (tx.randomize() with{tx.wr_rd==1'b1;});
					temp=new tx;
					mem_common::gen2bfm.put(temp);
					tx.print("mem_gen");
					txQ.push_back(temp);
				end

				repeat(5) begin
					temp=txQ.pop_front();
					tx=new();
					assert (tx.randomize() with {tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;});
					mem_common::gen2bfm.put(tx);
					tx.print("mem_gen");
				end

			end
		
			"NWR_NRD":begin
				tx=new();
				repeat(mem_common::N) begin
					assert (tx.randomize() with{tx.wr_rd==1'b1;});
					temp=new tx;
					mem_common::gen2bfm.put(temp);
					tx.print("mem_gen");
					txQ.push_back(temp);
				end

				repeat(mem_common::N) begin
					temp=txQ.pop_front();
					tx=new();
					assert (tx.randomize() with {tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;});
					mem_common::gen2bfm.put(tx);
					tx.print("mem_gen");
				end
		
			end
		endcase
	endtask
endclass
