#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { DIAMOND_MAKEDB } from '../../../../modules/diamond/makedb/main.nf'
include { DIAMOND_BLASTP } from '../../../../modules/diamond/blastp/main.nf'

workflow test_diamond_blastp {

    db = [ file(params.test_data['sarscov2']['genome']['proteome_fasta'], checkIfExists: true) ]
    fasta = [ file(params.test_data['sarscov2']['genome']['proteome_fasta'], checkIfExists: true) ]
    outext = 'txt'

    DIAMOND_MAKEDB ( db )
    DIAMOND_BLASTP ( [ [id:'test'], fasta ], DIAMOND_MAKEDB.out.db, outext )
}

workflow test_diamond_blastp_daa {

    db = [ file(params.test_data['sarscov2']['genome']['proteome_fasta'], checkIfExists: true) ]
    fasta = [ file(params.test_data['sarscov2']['genome']['proteome_fasta'], checkIfExists: true) ]
    outext = 'daa'

    DIAMOND_MAKEDB ( db )
    DIAMOND_BLASTP ( [ [id:'test'], fasta ], DIAMOND_MAKEDB.out.db, outext )
}
