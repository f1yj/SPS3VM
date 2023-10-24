# SPS3VM: Solution Paths for Semi-Supervised Support Vector Machines

Welcome to the repository for SPS3VM, a novel approach to optimizing hyperparameters for Semi-Supervised Support Vector Machines (S$^3$VM). In the ever-evolving field of machine learning, semi-supervised learning plays a crucial role by allowing models to leverage unlabeled data to enhance their generalization capabilities. However, one of the significant challenges in semi-supervised learning is selecting the most appropriate hyperparameters.

## Overview

S$^3$VM is a powerful tool, but to achieve optimal performance, it's essential to carefully choose the right hyperparameters. Traditional methods for searching optimal parameter values, such as grid search, can be computationally demanding, making it a critical open problem in the field.

In this repository, we introduce Solution Paths for S$^3$VM (SPS$^3$VM), which provides a novel approach to tackle this problem. SPS$^3$VM enables us to track solutions of the non-convex S$^3$VM with respect to the hyperparameters. This is accomplished by employing incremental and decremental learning methods to update the solution while ensuring it satisfies the KKT conditions. By analyzing the solution paths of S$^3$VM and leveraging the piecewise linearity of the model function, we can identify the model with the minimum cross-validation error across a range of candidate hyperparameters. 

## Key Contributions

- **Innovative Solution Path Algorithm:** SPS$^3$VM is the first solution path algorithm for optimizing the non-convex optimization problem of semi-supervised learning models.

- **Convergence Analysis:** We provide a finite convergence analysis for SPS$^3$VM, demonstrating its reliability and stability.

- **Reduced Computational Complexity:** Our experimental results on various benchmark datasets show that SPS$^3$VM can effectively search for hyperparameters, including regularization and ramp loss parameters. Furthermore, it significantly reduces computational time while maintaining competitive or even superior generalization performance compared to the conventional grid search approach.

## Repository Contents

- **main_SP.m:** This script generates results for SPS$^3$VM, enabling you to experience the benefits of our novel approach to hyperparameter selection.

- **main_GS.m:** If you are interested in comparing the results with a traditional grid search approach, you can use this script to generate the corresponding results.

## Getting Started

To get started, follow these steps:

1. Clone or download this repository.
2. Use the provided scripts (main_SP.m and main_GS.m) to generate results for SPS$^3$VM and traditional grid search, respectively.
3. Explore and analyze the results to see the advantages of SPS$^3$VM in terms of hyperparameter optimization.

## Citing SPS3VM

If you find SPS$^3$VM useful for your research or work, please consider citing our paper to acknowledge our contributions. You can find the relevant citation information in the paper associated with this project.

We hope that SPS$^3$VM proves to be a valuable addition to your machine learning toolbox. If you have any questions or need further assistance, feel free to reach out to us.

Happy coding!
