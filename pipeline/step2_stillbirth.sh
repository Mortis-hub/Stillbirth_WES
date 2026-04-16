#!/bin/bash

anno_path="/annotate/VEP/groupfiles/"
step0_path="/saige/step0/"
step1_path="/Burden_test/STILLBIRTH/step1/Ctrl_vs_Case/"
plink_path="/Burden_test/STILLBIRTH/sample_QC/Ctrl_vs_Case/"
output_path="/Burden_test/STILLBIRTH/step2/Ctrl_vs_Case/"

for i in $(seq 1 22); do
	dx run step2_SPAtests.R \
		-iGMMATmodelFile="${step1_path}/Stillbirth_sparseGRM.rda" \
		-ivarianceRatioFile="${step1_path}/Stillbirth_sparseGRM.varianceRatio.txt" \
		-ispGRMfile="${step0_path}/Stillbirth_MarkersUsed.sparseGRM.mtx" \
		-ispGRMSamplefile="${step0_path}/Stillbirth_MarkersUsed.sparseGRM.mtx.sampleIDs.txt" \
		-ibed="${plink_path}/chr${i}_Stillbirth_QC.bed" \
		-ibim="${plink_path}/chr${i}_Stillbirth_QC.bim" \
		-ifam="${plink_path}/chr${i}_Stillbirth_QC.fam" \
		-igrpfile="${anno_path}/chr${i}.revel.group.txt" \
		-ichrom="${i}" \
		-iannotation_in_groupTest="LoF,missense,LoF:missense" \
		-imaxMAF_in_groupTest="0.00001,0.0001,0.001,0.01" \
		-ioutput_prefix="c${i}_Stillbirth_REVEL" \
		-iisFast=FALSE \
		--destination="${output_path}/REVEL/" \
		--name="Saige_Step2_Stillbirth_chr${i}" --tag="SAIGE_Step2" \
		--instance-type "mem3_ssd2_v2_x4" \
		--priority low --brief --yes
done
