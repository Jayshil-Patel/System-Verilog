class transatcion;
    //this class contains the readings we want to generate or to observe
    //declaring teh transaction items
    rand bit [3:0] a;  //random pattern is generated to verify the DUT  
    rand bit [3:0] b;
         bit [6:0] c; // to observe output

    function void display(string name);
        $display("----------------------------"); //display finction are used to display the activity done by different class or module
        $display(" - %s ",name);
        $display("----------------------------");
        $display(" - a = %0d, b = %0d",a,b);
        $display(" - c = %0d",c);
        $display("----------------------------");
    endfunction
endclass
