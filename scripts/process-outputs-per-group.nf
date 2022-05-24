#!/usr/bin/env nextflow

/*
================================================================================
AIM : Group files by a glob pattern and execute a task for each group of files.
================================================================================
*/

// Create channel emitting grouped fastq files
Channel
    .fromPath( "${params.input_dir}/*.fastq", checkIfExists: true )
    .map { file -> 
        def key = (file =~ /.{6}_(\w{1})_L\d{1}_(R\d{1}).fastq/)[0]
        return tuple("sample_" + key[1] + "_" + key[2], file)
    }
    .groupTuple()
    .set { ch_grouped_fastq_files }

// Process each group of fastq files
process processEachGroup {

    tag "${key}"
    echo true
    publishDir path: "${params.output_dir}", mode: "copy"

    input:
    set key, file(fastq_files) from ch_grouped_fastq_files

    output:
    file("*") into ch_merged_fastq_files

    script:
    """
    cat ${fastq_files} >> ${key}.fastq
    """

}