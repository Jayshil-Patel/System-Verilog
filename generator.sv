class generator;

    //declaring transaction class
    rand transatcion trans;// instance (handle) of transaction class is trans
    //rand to make class member ramdom

    //repeat count, to specify number of  items to generate
    int repeat_count;//variable

    //mailbox, to generate and send to packet to driver
    mailbox gen2drive;//predefined in SV, used for communication
    //gen2drive is local variable

    //event, to indicate the end of transaction generation
    event ended;

    //constructor is method to assign memory
    function new(mailbox gen2drive);//this is not object
        //getting the mailbox handle from env, in order to share the transaction
        //packet between the generator and driver, the same mailbox is shared between both.
        this.gen2drive=gen2drive;
        
    endfunction

    //main task, generates(create and randomizes) the repeat_count number of transaction packets and puts into mailbox.


    task  main();
        repeat(repeat_count) begin
            trans=new();//object //assigns a memory
            if ( !trans.randomize() ) $fatal("Gen:: trans ramdomization failed");
            trans.$display("[ Generator ]");//move to transaction class and display activity performed by generator.
            gen2drive.put(trans);//given to driver
        end
        -> ended; //triggering the indicates the end of generation

        
    endtask
endclass