#!/usr/bin/env nextflow

/*
================================================================================
AIM : Execute a certain task for each file in a directory.
================================================================================
*/

// Channel emitting fastq files found in data directory
Channel
    .fromPath( "data/*.fastq", checkIfExists: true )
    .set { ch_fastq_files }

process handleEachFastqFile {

    tag "${fastq_file.simpleName}"
    publishDir path: "outs", mode: "copy"

    input:
    file(fastq_file) from ch_fastq_files

    output:
    file("*") into ch_text_files

    script:
    """
    echo ${fastq_file.simpleName} > ${fastq_file.getSimpleName()}.txt
    """

}