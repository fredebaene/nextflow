#!/usr/bin/env nextflow

/*

You need to execute a task for each record in a comma-separated 
values (CSV) file.

*/

// Initialize parameter pointing to sample metadata file
params.sample_metadata_file = "samples.csv"

// Create channel emmiting each record in the CSV file
Channel
    .fromPath( "${params.sample_metadata_file}", checkIfExists: true )
    .splitCsv( header: true )
    .map { row -> tuple( row.sample, file(row.reads_one), file(row.reads_two) ) }
    .set { ch_sample_metadata }

// Process each CSV record
process processEachCSVRecord {

    echo true

    input:
    set val(sample), file(reads_one), file(reads_two) from ch_sample_metadata

    script:
    """
    echo ${sample} : ${reads_one.simpleName} + ${reads_two.simpleName}
    """

}