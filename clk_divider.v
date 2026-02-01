


//DAY -01
//CLOCK DIVIDER WITH ENABLE AND BYPASS
//CONVERTING HIGH FREQUENCY TO LOWER FREQUENCY


`timescale 1ns/1ps

module clk_div_1  (clk,rstn,enable,clk_en);
        input 	clk,rstn,enable;		
		output reg clk_en;
		
        integer count;		
	  parameter	integer Div_Factor=10;
		
		always @(posedge clk)
		    begin
			if(rstn==0 || enable==0)
			  begin
			     count<=0;
				 clk_en<=1'b0;
			  end
		
			else if(Div_Factor==1)
			         clk_en<=1'b1;
					 
		    
			else begin
			
			if(count<Div_Factor/2)
			    clk_en<=1;
			else
			    clk_en<=0;
			
			
			if(count==Div_Factor-1)
			    count<=0;
			else 
			    count<=count+1;
			
		      
			end  	 

       end			
endmodule