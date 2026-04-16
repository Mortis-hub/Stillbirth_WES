#!/bin/bash

phe_file_white="/Burden_test/STILLBIRTH/stillbirth.phe"
sparse_file_dir="/saige/step0/"
step1_dir="/Burden_test/STILLBIRTH/step1/Ctrl_vs_Case/"

dx run step1_fitNULLGLMM.R \
        -isparse_grm_mtx=${sparse_file_dir}/Stillbirth_MarkersUsed.sparseGRM.mtx \
        -isparse_grm_sample_id_txt=${sparse_file_dir}/Stillbirth_MarkersUsed.sparseGRM.mtx.sampleIDs.txt \
        -iplink_bim=${step1_part1_white_dir}/Stillbirth.bim \
        -iplink_bed=${step1_part1_white_dir}/Stillbirth.bed \
        -iplink_fam=${step1_part1_white_dir}/Stillbirth.fam \
        -iuse_sparse_grm_fit_null=true \
        -iphenotype_file=${phe_file_white} \
        -ipheno_col=stillbirth_classify \
        -icovariates=age,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
        -isample_id_col=IID \
        -itrait_type=quantitative \
        -iis_cate_variance_ratio=true \
        -iinverse_normalize=true \
        -iuse_sparse_grm_variance_ratio=true \
        -ioutput_file_prefix=Stillbirth_sparseGRM \
        --priority low --tag="step1" --name SAIGE --brief --yes --instance-type "mem3_ssd2_v2_x8" --tag="SAIGE_Step1" --destination="${step1_dir}"
