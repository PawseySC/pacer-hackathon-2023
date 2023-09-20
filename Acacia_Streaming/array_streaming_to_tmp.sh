#!/bin/bash
#SBATCH --job-name=s3_processing
#SBATCH --output=s3_processing_%A_%a.out
#SBATCH --error=s3_processing_%A_%a.err
#SBATCH --array=1-5
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=0:10:00

# Load necessary modules and activate mamba environment
module load awscli/1.27.84
source activate /software/projects/pawsey0001/sbeecroft/mambaforge/envs/megapharokka_env

# AWS S3 bucket and profile information
S3_ENDPOINT_URL="https://projects.pawsey.org.au"
AWS_PROFILE="director2187"
S3_BUCKET="pharokka"

# Determine the input file for this job array task based on the task ID
TASK_ID=$((SLURM_ARRAY_TASK_ID))

# Read the file list into an array
files=($(cat input.txt))

# Get the input file for this task
input_file=${files[$SLURM_ARRAY_TASK_ID - 1]}

#Stream the file to tmp via gunzip
aws --endpoint-url=$S3_ENDPOINT_URL --profile=$AWS_PROFILE s3 cp s3://$S3_BUCKET/$input_file - | gunzip > /tmp/$input_file.fasta

#run megapharokka with tmp input
megapharokka.py -i /tmp/$input_file.fasta \
  -o /scratch/pawsey0001/sbeecroft/mega/sarah_test \
  -t 1 \
  -d /scratch/director2187/hackathon/git/MegapharokkaDB \
  -g 'prodigal-gv' \
  -m -s -f \
  --skip_extra_annotations  \
  --mmseqs2
