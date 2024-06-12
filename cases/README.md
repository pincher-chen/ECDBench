## Introduction
The performance of DFT calculation acceleration. Both models, trained on the ECD-PBE-id split and the ECD-PBE_HSE_tuning-id split respectively, are evaluated on 19 randomly selected materials from the intersection of their test sets.

## How to get converged steps?
```
python ../script/get_iteration_steps.py $case_id/OUTCAR 
```