#!/usr/bin/env nextflow

// Create channel emitting fastq files
Channel
    .fromPath( "${params.aws_input_bucket}/*.fastq", checkIfExists: true )
    .map { file -> 
        def key = file.simpleName.substring(0, 8)
        return tuple( key, file )
    }
    .groupTuple()
    .set { ch_grouped_fastq_files }

process foo {

    tag "${key}"
    echo true
    publishDir path: "${params.aws_output_bucket}"

    input:
    set key, file(fastq_files) from ch_grouped_fastq_files

    output:
    file("*") into ch_merged_fastq_files

    script:
    """
    cat ${fastq_files} >> ${key}.txt
    """

}