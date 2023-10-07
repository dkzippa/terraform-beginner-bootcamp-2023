# Terraform Beginner Bootcamp 2023


#### Semantic Versioning:

From: [https://semver.org/](https://semver.org/)

Given a version number **MAJOR.MINOR.PATCH**, increment the:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata 
are available as extensions to the `MAJOR.MINOR.PATCH` format.


#### Gitpod
- added `bin/install-terraform.sh` script to install terraform
- fixed `.gitpod.yml` to run on every workspace start(`before`) and not only on creation(`init`)


##### Refactor AWS cli
- make new script
- run it from .gitpod.yml
- check identity is configured correctly `aws sts get-caller-identity`


#### make TF random provider
- add random provider
- test random provider


##### create with TF simple aws s3 bucket
- create TF simple aws s3 bucket using aws provider
- use TF random provider
