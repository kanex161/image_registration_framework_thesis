#!/bin/bash -l        
#SBATCH --time=5:00:00
#SBATCH -c 16
#SBATCH --mem-per-cpu=4g
#SBATCH --tmp=10g
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=kanex161@umn.edu

eval "$(conda shell.bash hook)" 
conda activate lab2im_registration

papermill ./registration_from_nifti.ipynb ./notebook_outputs/registration_from_nifti_${SLURM_ARRAY_TASK_ID}.ipynb \
	-p selected  $SLURM_ARRAY_TASK_ID \
	-p indir ../data/outputs/lab2im/brains/ \
	-p outdir ../data/outputs/baseline_registration/test_output_${SLURM_ARRAY_TASK_ID} \
	-k lab2im_registration


