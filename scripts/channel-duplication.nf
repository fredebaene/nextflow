#!/usr/bin/env nextflow

/*

Use the into() operator to copy the items emitted by a source 
channel into multiple target channels.

*/

// Create a channel emitting fastq files
Channel
    .fromPath("data/*.fastq")
    .into { ch_fastq_file_name; ch_fastq_file_classes }

ch_fastq_file_name.view { "${it}" }
ch_fastq_file_classes.view { "${it.getClass()}" }