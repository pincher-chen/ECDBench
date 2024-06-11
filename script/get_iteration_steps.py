#!/usr/bin/env python3

def get_iteration_steps(outcar_path):
    iteration_steps = 0
    
    with open(outcar_path, 'r') as file:
        for line in file:
            if "Iteration" in line or "Step" in line:
                iteration_steps += 1

    return iteration_steps

if __name__ == "__main__":
    import argparse
    
    # Set up command line argument parsing
    parser = argparse.ArgumentParser(description="Extract iteration steps from VASP OUTCAR file.")
    parser.add_argument("outcar_path", help="Path to the VASP OUTCAR file.")
    args = parser.parse_args()
    
    # Get iteration steps
    steps = get_iteration_steps(args.outcar_path)
    print(f"Total iteration steps: {steps}")
