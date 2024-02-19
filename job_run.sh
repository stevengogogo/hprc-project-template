#!/bin/bash
#SBATCH --job-name=benchmark_compile_bs_2500
#SBATCH --time=0-10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --output=logs/out.%j-%x-%2t
#SBATCH --gres=gpu:a100:1
#SBATCH --partition=gpu
#SBATCH --mail-type=END
#SBATCH --mail-user=stchiu@tamu.edu

module purge
ml CUDA/12.3.0 GCCcore/13.2.0
#source ../torch_venv/bin/activate

module load Anaconda3/2022.10
source activate gpjax

cp -r ./data $TMPDIR

# jobstats -t -s &
#python ./main.py --device cuda --batch_size 2500 --data_dir $TMPDIR/data/061/train --test_dir $TMPDIR/data/061/test
python main.py 
# jobstats