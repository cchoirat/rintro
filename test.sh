#! /usr/bin/env Rscript
#SBATCH -n 1               # (Max) number of tasks per job, for R usually 1
#SBATCH -o out-%a.txt      # File for the standard output
#SBATCH -e err-%a.txt      # File for the standard error
#SBATCH -p serial_requeue  # Partition to use
#SBATCH --mem-per-cpu=1024 # Memory required per CPU, in MegaBytes
#SBATCH -a 10-20           # Array of 11 jobs, with ids 10, 11, ..., 20

if (Sys.getenv("SLURM_JOB_ID") != "") {
  
  meanDist <- function(n, nsamp = 500) {
    replicate(nsamp, mean(rnorm(n)))
  }
  
  my_id <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))
  
  print(meanDist(my_id))
}