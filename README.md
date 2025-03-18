# Targets Template

Template for R data analysis projects using `targets` and `renv` for maximum reproducibility and performance.

## Overview

This repository serves as a template for creating R data analysis projects with a focus on reproducibility and performance. It leverages the `targets` package for pipeline management and `renv` for environment management.

## Features

- **Targets**: Use the `targets` package to build and manage reproducible data analysis pipelines.
- **Renv**: Utilize `renv` to create isolated and reproducible R environments.
- **HTML Reports**: Generate HTML reports for your analysis results.

## Repository Structure

```
.
├── R                      # Directory for R scripts
├── _targets               # Directory for targets internal files
├── data                   # Directory for data
│   └── raw                # Raw data files
├── markdown               # Directory for markdown files
├── output                 # Directory for output files
│   ├── plots              # Generated plots
│   ├── presentations      # Presentation files
│   ├── reports            # Generated reports
│   └── tables             # Generated tables
└── renv                   # Renv environment directory
```

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/corneliushennch/targets_template.git
   cd targets_template
   ```

2. **Install Dependencies**

   ```r
   renv::restore()
   ```

3. **Run the Pipeline**

   ```r
   # run the pipeline
   targets::tar_make()
   
   # inspect the pipeline
   tar_visnetwork()
   ```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have any suggestions or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions, please contact the repository maintainer at [corneliushennch](https://github.com/corneliushennch).
```

