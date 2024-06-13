# ECDBench
A Machine Learning Benchmark for Predicting Enhanced-Precision Electronic Charge Density in Crystalline Inorganic Materials

## Introduction

ECD provides precise DFT-calculated charge density for 140,646 PBE data and a subset of 7147 HSE data. 

In this repo, we provide both the ECD dataset and the benchmark code, which can be highly valuable for developing machine learning methods and accelerating materials design for scientific and technological applications.

## Dataset Usage
We provide a script to download charge density files from Matgen website.


```
$ cd data/pbe;bash ../../script/download_pbe_charge.sh
$ cd data/hse;bash ../../script/download_hse_charge.sh 
```

## Tasks
|Task | Total entries | Traning/validation/testing entries |
|:--------| :---------:|--------:|
|ECD-PBE-id |  140,646 | 138,134/512/2000|
|ECD-MP-id | 2000 | -/-/2000 |
|ECD-PBE_HSE-id | 1000 |-/-/1000 |
|ECD-PBE_HSE_tuning-id | 7147| 5647/500/1000 |

To thoroughly evaluate the performance of charge density predictions, we define the following tasks utilizing PBE functional and HSE functional precision from the ECD dataset, and the MP PBE precision pretrained model.

## Requirements
We include key dependencies below.
```
ase                     3.22.1
e3nn                    0.5.1
hydra-core              1.3.2
hydra-submitit-launcher 1.2.0
scipy                   1.7.3
tensorboard             2.11.2
tensorboard-data-server 0.6.1
tensorboard-plugin-wit  1.8.1
torch                   1.13.1+cu117
torchaudio              0.13.1+cu117
torchvision             0.14.1+cu117
```

[ChargE3Net](https://github.com/AIforGreatGood/charge3net) constructs rotationally equivariant networks using vector representations and improves model accuracy by incorporating higher-order equivariant features, showing diverse performance on the MP dataset. Therefore, the equivariant quantum tensor network ChargE3Net is selected as the primary benchmark for the ECD dataset. When the [Charge3Net code](https://github.com/AIforGreatGood/charge3net) is downloaded to the this local path, you can execute the following commands to train and tune the model.

Training PBE data:
```
#!/bin/sh
source activate Charge3net
cd ~/charge3net-main

export NCCL_DEBUG=info
export NCCL_IB_HCA=mlx5_0:1
export NCCL_IB_TIMEOUT=2
export NCCL_IB_RETRY_CNT=13
export NCCL_IB_PCI_RELAXED_ORDERING=1

python src/train_from_config.py -cd configs/charge3net -cn train_pbe_e3_final  nnodes=1 nprocs=8 
```

Training HSE data:

```
#!/bin/sh
source activate Charge3net
cd ~/charge3net-main

export NCCL_DEBUG=info
export NCCL_IB_HCA=mlx5_0:1
export NCCL_IB_TIMEOUT=2
export NCCL_IB_RETRY_CNT=13
export NCCL_IB_PCI_RELAXED_ORDERING=1

python src/train_from_config.py -cd configs/charge3net -cn train_hse_e3_final  nnodes=1 nprocs=8 checkpoint_path=~/pytorch/charge3net-main/models/charge3net_pbe.pt
```


