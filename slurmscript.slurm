#!/bin/bash
#SBATCH --job-name=deepreach_test     # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=4        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=4G         # memory per cpu-core (4G is default)
#SBATCH --gres=gpu:1             # number of gpus per node
#SBATCH --time=04:59:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-type=fail         # send email if job fails
#SBATCH --mail-user=vikashm@princeton.edu

module purge
module load anaconda3/2022.5
conda activate testenv

CUDA_VISIBLE_DEVICES=0 python experiment_scripts/train_hji_doubleInt.py --experiment_name experiment_doubleInt --minWith target --num_src_samples 10000 --pretrain --pretrain_iters 10000 --num_epochs 120000 --counter_end 110000
# CUDA_VISIBLE_DEVICES=0 python experiment_scripts/train_hji_particle2D.py --experiment_name experiment_2dParticle --minWith target --num_src_samples 10000 --pretrain --pretrain_iters 10000 --num_epochs 120000 --counter_end 110000
# CUDA_VISIBLE_DEVICES=0 python experiment_scripts/train_hji_air3D.py --experiment_name experiment_3 --minWith target --tMax 1.1 --velocity 0.75 --omega_max 3.0 --angle_alpha 1.2 --num_src_samples 10000 --pretrain --pretrain_iters 10000 --num_epochs 120000 --counter_end 110000