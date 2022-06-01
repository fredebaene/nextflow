#!/usr/bin/env nextflow

/*
================================================================================
    VALIATE COMMAND LINE PARAMETERS
================================================================================
*/

if ( !params.run_id ) {

    exit 1, "The 'run_id' parameter is not initialized"

} else {

    println "The 'run_id' parameter is initialized : ${params.run_id}"

}

if ( !params.out_id ) {

    params.out_id = params.run_id
    println "The 'out_id' parameter equals the 'run_id' parameter : ${params.out_id}"

} else {

    println "The 'out_id' parameter does not equal the 'run_id' parameter : ${params.out_id}"

}

if ( !params.sample_sheet ) {
    
    exit 1, "The 'sample_sheet' parameter is not initialized"

} else {

    println "The 'sample_sheet' parameter is initialized : ${params.sample_sheet}"

}

if ( !params.multi_dir ) {
    
    exit 1, "The 'multi_dir' parameter is not initialized"

} else {

    println "The 'multi_dir' parameter is initialized : ${params.multi_dir}"

}


println "FINISHED SCRIPT"