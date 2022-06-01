#!/usr/bin/env nextflow

/*
================================================================================
    SET DEFAULT PARAMETER VALUES
================================================================================
*/

params.run_id = null
params.out_id = null
params.sample_sheet = null
params.multi_dir = null

/*
================================================================================
    VALIATE COMMAND LINE PARAMETERS
================================================================================
*/

if ( !params.run_id ) {

    exit 1, "The 'run_id' parameter is not specified"

} else {

    println "The 'run_id' parameter is specified : ${params.run_id}"

}

if ( !params.out_id ) {

    params.out_dir = params.run_id
    println "The 'out_dir' parameter is specified : ${params.out_dir}"

} else {

    params.out_dir = params.out_id
    println "The 'out_dir' parameter is specified : ${params.out_dir}"

}

if ( !params.sample_sheet ) {
    
    exit 1, "The 'sample_sheet' parameter is not specified"

} else {

    println "The 'sample_sheet' parameter is specified : ${params.sample_sheet}"

}

if ( !params.multi_dir ) {
    
    exit 1, "The 'multi_dir' parameter is not specified"

} else {

    println "The 'multi_dir' parameter is specified : ${params.multi_dir}"

}


println "FINISHED SCRIPT"