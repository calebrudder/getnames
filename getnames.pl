#!/usr/bin/perl -w 

#read entire file one line at a time into lines array
@lines = <STDIN>;
%nameHash = ();

foreach $line (@lines){
    
    @lineSplit = split(":", $line);
    $gid = $lineSplit[3];
    
    if($gid >= 1000){
        
        $name = $lineSplit[4];
        @nameSplit = split(" ", $name);
        
        #check if the name starts with a prefix
        #and then assign the first name of the person to the name variable
        if($nameSplit[0] eq "Dr" || $nameSplit[0] eq "Mr" || $nameSplit[0] eq "Mrs" 
            || $nameSplit[0] eq "Ms" || $nameSplit[0] eq "Miss"){
            
            $name = $nameSplit[1];
        }else{
            $name = $nameSplit[0];
        }
        
        if(exists $nameHash{$name}){
            $nameHash{$name}++;
        
        }else{
            $nameHash{$name} = 1;
        
        }
    }
}

    foreach $key (sort {lc $a cmp lc $b}(keys(%nameHash))) {
            print "$key occurs $nameHash{$key} times\n";
    }
    